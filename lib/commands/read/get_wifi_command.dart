import 'package:flutter_tello/api/tello_command.dart';

class GetWifiCommand implements TelloCommand {
  @override
  String execute() {
    // todo: tell the tello what to do.
    return "wifi?";
  }

  @override
  String getTitle() {
    return "Get Tello's current Wi-Fi SNR";
  }
}
