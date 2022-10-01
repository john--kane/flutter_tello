import 'package:flutter_tello/api/tello_command.dart';

class GetBatteryCommand implements TelloCommand {
  @override
  String execute() {
    // todo: tell the tello what to do.
    return "battery?";
  }

  @override
  String getTitle() {
    return "Get Tello's current battery";
  }
}
