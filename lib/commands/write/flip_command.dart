import 'package:flutter_tello/api/enums.dart';
import 'package:flutter_tello/api/tello_command.dart';

class FlipCommand implements TelloCommand {
  late FlipDirection direction;
  FlipCommand(this.direction);

  @override
  String execute() {
    var flipDirection;
    switch (direction) {
      case FlipDirection.back:
        flipDirection = "b";
        break;
      case FlipDirection.front:
        flipDirection = "f";
        break;
      case FlipDirection.left:
        flipDirection = "l";
        break;
      case FlipDirection.right:
        flipDirection = "r";
        break;
      default:
        flipDirection = "f";
        break;
    }

    return "flip ${flipDirection}";
  }

  @override
  String getTitle() {
    return 'Flip the Tello';
  }
}
