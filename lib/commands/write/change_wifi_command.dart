import 'package:flutter_tello/api/tello_command.dart';

class ChangeWifiCommand implements TelloCommand {
  String ssid;
  String password;

  ChangeWifiCommand({required this.ssid, required this.password});

  @override
  String execute() {
    // todo: tell the tello what to do.
    return "wifi $ssid $password";
  }

  @override
  String getTitle() {
    return 'Change Wifi';
  }
}
