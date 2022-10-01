import 'package:flutter_tello/api/tello_command.dart';

class RemoteControlCommand implements TelloCommand {
  late int roll;
  late int pitch;
  late int yaw;
  late int vertical;

  RemoteControlCommand({int roll = 0, int pitch = 0, int yaw = 0, int vertical = 0});

  @override
  String execute() {
    return "rc $roll $pitch $vertical $yaw";
  }

  @override
  String getTitle() {
    return 'Remote Control';
  }
}
