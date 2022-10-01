import 'package:flutter_tello/api/enums.dart';
import 'package:flutter_tello/api/tello_command.dart';

class CurveToPositionCommand implements TelloCommand {
  late int x1;
  late int y1;
  late int z1;
  late int x2;
  late int y2;
  late int z2;
  late int speed;
  late Mission mission;

  CurveToPositionCommand({required this.mission, this.x1 = 0, this.y1 = 0, this.z1 = 0, this.x2 = 0, this.y2 = 0, this.z2 = 0, this.speed = 20});

  @override
  String execute() {
    // todo: tell the tello what to do.
    return "curve $x1 $y1 $z1 $x2 $y2 $z2 $speed ${mission.name}";
  }

  @override
  String getTitle() {
    return 'Curve to Position with Mission Pad';
  }
}
