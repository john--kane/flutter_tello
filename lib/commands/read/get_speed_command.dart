import 'package:flutter_tello/api/tello_command.dart';

class GetSpeedCommand implements TelloCommand {
  @override
  String execute() {
    // todo: tell the tello what to do.
    return "speed?";
  }

  @override
  String getTitle() {
    return "Get Tell's speed";
  }
}
