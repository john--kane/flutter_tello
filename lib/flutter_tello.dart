library flutter_tello;

import 'dart:convert';
import 'dart:io';

import 'package:flutter_tello/api/imu_acceleration.dart';
import 'package:flutter_tello/api/imu_attitude.dart';
import 'package:flutter_tello/api/imu_velocity.dart';
import 'package:flutter_tello/api/tello_command.dart';
import 'package:flutter_tello/api/tello_state.dart';
import 'package:flutter_tello/command_history.dart';
import 'package:flutter_tello/commands/write/startup_command.dart';
import 'package:rxdart/rxdart.dart';
import 'package:udp/udp.dart';

export 'commands/control/curve_to_position_command.dart';
export 'commands/control/emergency_command.dart';
export 'commands/control/flip_command.dart';
export 'commands/control/fly_command.dart';
export 'commands/control/fly_to_position_command.dart';
export 'commands/control/land_command.dart';
export 'commands/control/rotate_command.dart';
export 'commands/control/take_off_command.dart';
export 'commands/control/video_stream_command.dart';
export 'commands/read/get_speed_command.dart';
export 'commands/write/change_wifi_command.dart';
export 'commands/write/remote_control_command.dart';
export 'commands/write/set_speed_command.dart';
export 'commands/write/startup_command.dart';

class TelloConfiguration {
  int receivePort;

  String telloAddress;
  int telloPort;

  TelloConfiguration({this.telloAddress = "192.168.10.1", this.receivePort = 8890, this.telloPort = 8889});
}

const String errorIdentifier = "error";

class Tello {
  // Setup
  UDP? _receiveSocket;
  UDP? _videoReceiveSocket;
  UDP? _sendSocket;
  Endpoint? _sendEndpoint;
  Endpoint? _receiveEndpoint;
  TelloConfiguration configuration;
  int timeoutInSeconds;
  CommandHistory _commandHistory = CommandHistory();

  // Listening
  PublishSubject<String> commandsQueue = PublishSubject<String>();

  Tello({required this.configuration, this.timeoutInSeconds = 20});

  get rawDataStream => _receiveSocket?.asStream(timeout: Duration(seconds: timeoutInSeconds)).map((datagram) => processDatagram(datagram));
  get history => _commandHistory.commandHistoryList;

  Stream<TelloState> get state =>
      rawDataStream?.map<TelloState>((String currentState) {
        // Thanks to ryze_tello
        RegExp telloStateRegex = RegExp(r"((pitch:)(.+)(;roll:)(.+)(;yaw:)(.+)(;vgx:)(.+)(;vgy:)(.+)(;vgz:)(.+)(;templ:)(.+)(;temph:)(.+)(;tof:)(.+)(;h:)(.+)(;bat:)(.+)(;baro:)(.+)(;time:)(.+)(;agx:)(.+)(;agy:)(.+)(;agz:)(.+)(;))");

        RegExpMatch matches = telloStateRegex.firstMatch(currentState)!;

        return TelloState(
          ImuAttitude(int.parse("${matches[3]}"), int.parse("${matches[5]}"), int.parse("${matches[7]}")),
          ImuVelocity(int.parse("${matches[9]}"), int.parse("${matches[11]}"), int.parse("${matches[13]}")),
          ImuAcceleration(double.parse("${matches[29]}"), double.parse("${matches[31]}"), double.parse("${matches[33]}")),
          (double.parse("${matches[15]}") + double.parse("${matches[17]}")) / 2,
          int.parse("${matches[19]}"),
          int.parse("${matches[21]}"),
          int.parse("${matches[23]}"),
          double.parse("${matches[25]}"),
          int.parse("${matches[27]}"),
        );
      }) ??
      Stream.empty();

  Future<int> sendCommand(TelloCommand command) async {
    _commandHistory.add(command);

    final data = command.execute();
    if (data.isEmpty || _sendEndpoint == null) return 0;

    final bufferList = utf8.encode(data);
    try {
      return await _sendSocket?.send(bufferList, Endpoint.unicast(InternetAddress(configuration.telloAddress), port: Port(configuration.telloPort))) ?? 0;
    } catch (e) {
      print("Error $e");
      return 0;
    }
  }

  Future<Tello> setup() async {
    try {
      if (_receiveSocket != null || _sendSocket != null) {
        await destroy();
      }

      // setup the endpoint configurations: InternetAddress(configuration.telloAddress),
      _sendEndpoint = Endpoint.any(port: Port(configuration.telloPort));
      _receiveEndpoint = Endpoint.loopback(port: Port(configuration.receivePort));

      // bind
      _sendSocket = await UDP.bind(_sendEndpoint!);
      final result = await sendCommand(StartupCommand());

      print("Command: $result");
      _receiveSocket = await UDP.bind(_receiveEndpoint!);
    } catch (e) {
      print("Error in setup: $e");
    }

    return this;
  }

  Future<void> destroy() async {
    _receiveSocket?.close();
    _sendSocket?.close();
  }

  String processDatagram(Datagram? datagram) {
    if (datagram?.data != null) {
      return utf8.decode(datagram!.data).trim();
    }
    return "";
  }
}
