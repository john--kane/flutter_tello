import 'package:flutter_tello/api/tello_command.dart';

class GetSerialNumberCommand implements TelloCommand {
  @override
  String execute() {
    // todo: tell the tello what to do.
    return "sn?";
  }

  @override
  String getTitle() {
    return "Get Tello's serial number";
  }
}
