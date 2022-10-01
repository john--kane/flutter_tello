import 'package:flutter_tello/api/tello_command.dart';


class LandCommand implements TelloCommand {
  @override
  String execute() {
    // todo: tell the tello what to do.
    return "land";
  }

  @override
  String getTitle() {
    return 'Land';
  }
}
