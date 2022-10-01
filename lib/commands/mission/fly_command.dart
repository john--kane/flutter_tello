import 'package:flutter_tello/api/enums.dart';
import 'package:flutter_tello/api/tello_command.dart';

class FlyCommand implements TelloCommand {
  late Direction direction;
  late int lengthCm;
  late Mission mission;
  FlyCommand({this.direction = Direction.forward, required this.lengthCm, required this.mission});

  @override
  String execute() {
    return "${direction.name} $lengthCm ${mission.name}";
  }

  @override
  String getTitle() {
    return 'Fly with Mission Pad';
  }
}
