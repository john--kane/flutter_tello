import 'package:flutter_tello/api/enums.dart';
import 'package:flutter_tello/api/tello_command.dart';

class RotateCommand implements TelloCommand {
  late int angle;
  late RotationalDirection direction;
  RotateCommand(this.angle, this.direction);

  @override
  String execute() {
    int absAngle = angle;

    String turnDirection = direction == RotationalDirection.clockwise ? 'cw' : 'ccw';

    // if (angle < 0) {
    //   absAngle = -angle;
    //   turnDirection = 'c' + turnDirection;
    // }

    return "$turnDirection $absAngle";
  }

  @override
  String getTitle() {
    return 'Rotate';
  }
}
