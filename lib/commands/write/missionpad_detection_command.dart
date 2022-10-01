import 'package:flutter_tello/api/enums.dart';
import 'package:flutter_tello/api/tello_command.dart';

class MissionPadDetectionCommand implements TelloCommand {
  late MissionPadDetection detection;

  MissionPadDetectionCommand({required this.detection});

  @override
  String execute() {
    // todo: tell the tello what to do.
    return detection == MissionPadDetection.on ? "mon" : "moff";
  }

  @override
  String getTitle() {
    return 'Change mission pad detection';
  }
}
