import 'package:flutter_tello/api/tello_command.dart';

class ChangeWifiCommand implements TelloCommand {
  String name;
  String password;

  ChangeWifiCommand({required this.name, required this.password});

  @override
  String execute() {
    // todo: tell the tello what to do.
    return "wifi $name $password";
  }

  @override
  String getTitle() {
    return 'Change Wifi';
  }
}
