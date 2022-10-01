import 'package:flutter_tello/api/tello_command.dart';

class CurveToPositionCommand implements TelloCommand {
  late int x1;
  late int y1;
  late int z1;
  late int x2;
  late int y2;
  late int z2;
  late int speed;

  CurveToPositionCommand({x1 = 0, y1 = 0, z1 = 0, x2 = 0, y2 = 0, z2 = 0, speed = 20});

  @override
  String execute() {
    // todo: tell the tello what to do.
    return "curve $x1 $y1 $z1 $x2 $y2 $z2 $speed";
  }

  @override
  String getTitle() {
    return 'Fly to Position';
  }
}
