import 'package:flutter_tello/api/tello_command.dart';

class StopCommand implements TelloCommand {
  @override
  String execute() {
    return "stop";
  }

  @override
  String getTitle() {
    return 'Stop';
  }
}
