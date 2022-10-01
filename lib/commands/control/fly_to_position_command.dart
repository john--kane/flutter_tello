import 'package:flutter_tello/api/tello_command.dart';

class FlyToPositionCommand implements TelloCommand {
  late int x;
  late int y;
  late int z;
  late int speed;

  FlyToPositionCommand({this.x = 0, this.y = 0, this.z = 0, this.speed = 20});

  @override
  String execute() {
    // todo: tell the tello what to do.
    return "go $x $y $z $speed";
  }

  @override
  String getTitle() {
    return 'Fly to Position';
  }
}
