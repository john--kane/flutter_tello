import 'package:flutter_tello/api/tello_command.dart';

class TakeOffCommand implements TelloCommand {
  @override
  String execute() {
    // todo: tell the tello what to do.
    return "takeoff";
  }

  @override
  String getTitle() {
    return 'Take Off';
  }
}
