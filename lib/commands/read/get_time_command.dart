import 'package:flutter_tello/api/tello_command.dart';

class GetTimeCommand implements TelloCommand {
  @override
  String execute() {
    // todo: tell the tello what to do.
    return "time?";
  }

  @override
  String getTitle() {
    return "Get Tello's current flight time";
  }
}
