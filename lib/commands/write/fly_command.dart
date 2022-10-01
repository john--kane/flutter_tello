import 'package:flutter_tello/api/enums.dart';
import 'package:flutter_tello/api/tello_command.dart';

class FlyCommand implements TelloCommand {
  late Direction direction;
  late int lengthCm;

  FlyCommand({this.direction = Direction.forward, required this.lengthCm});

  @override
  String execute() {
    return "${direction.name} $lengthCm";
  }

  @override
  String getTitle() {
    return 'Fly';
  }
}
