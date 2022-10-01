import 'package:flutter_tello/api/enums.dart';
import 'package:flutter_tello/api/tello_command.dart';

class MissionPadDirectionCommand implements TelloCommand {
  late MissionPadDetectionDirection direction;

  MissionPadDirectionCommand({required this.direction});

  @override
  String execute() {
    int _direction = 2;
    switch (direction) {
      case MissionPadDetectionDirection.forward:
        _direction = 1;
        break;
      case MissionPadDetectionDirection.downward:
        _direction = 0;
        break;

      case MissionPadDetectionDirection.both:
      default:
        _direction = 2;
        break;
    }

    return "mdirection ${_direction}";
  }

  @override
  String getTitle() {
    return 'Change Mission pad direction';
  }
}
