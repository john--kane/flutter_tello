import 'package:flutter_tello/api/tello_command.dart';

class RemoteControlCommand implements TelloCommand {
  late int roll; //a -100 to +100
  late int pitch; //b -100 to +100
  late int altitude; //c -100 to +100
  late int yaw; //d -100 to +100

  RemoteControlCommand({int roll = 0, int pitch = 0, int yaw = 0, int vertical = 0});

  @override
  String execute() {
    return "rc $roll $pitch $altitude $yaw";
  }

  @override
  String getTitle() {
    return 'Remote Control';
  }
}
