import 'package:flutter_tello/api/tello_command.dart';

class SetSpeedCommand implements TelloCommand {
  late int speedCmPerSec;

  SetSpeedCommand(this.speedCmPerSec);

  @override
  String execute() {
    return "speed $speedCmPerSec";
  }

  @override
  String getTitle() {
    return 'Set Speed';
  }
}
