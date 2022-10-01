import 'package:flutter_tello/api/tello_command.dart';

class SetStationModeCommand implements TelloCommand {
  late String ssid;
  late String pass;

  SetStationModeCommand({required this.ssid, required this.pass});

  @override
  String execute() {
    return "ap $ssid $pass";
  }

  @override
  String getTitle() {
    return 'Set Station mode and connect to a new access point';
  }
}
