import 'package:flutter_tello/api/tello_command.dart';

class EmergencyCommand implements TelloCommand {
  @override
  String execute() {
    // todo: tell the tello what to do.
    return "emergency";
  }

  @override
  String getTitle() {
    return 'Emergency';
  }
}
