import 'package:flutter_tello/api/tello_command.dart';

class GetSDKCommand implements TelloCommand {
  @override
  String execute() {
    // todo: tell the tello what to do.
    return "sdk?";
  }

  @override
  String getTitle() {
    return "Get Tello's currentSDK version";
  }
}
