import 'package:flutter_tello/api/enums.dart';
import 'package:flutter_tello/api/tello_command.dart';

class JumpCommand implements TelloCommand {
  late int x;
  late int y;
  late int z;
  late int speed;
  late int yaw;
  late Mission mid1;
  late Mission mid2;

  JumpCommand({required this.mid1, required this.mid2, this.x = 0, this.y = 0, this.z = 0, this.speed = 20});

  @override
  String execute() {
    return "jump $x $y $z $speed $yaw ${mid1.name} ${mid2.name}";
  }

  @override
  String getTitle() {
    return 'Jump with Mission Pad';
  }
}
