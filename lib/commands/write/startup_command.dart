import 'package:flutter_tello/api/tello_command.dart';

class StartupCommand implements TelloCommand {
  @override
  String execute() {
    return "command";
  }

  @override
  String getTitle() {
    return 'Set Speed';
  }
}
