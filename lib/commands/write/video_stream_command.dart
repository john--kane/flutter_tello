import 'package:flutter_tello/api/enums.dart';
import 'package:flutter_tello/api/tello_command.dart';

class VideoStreamCommand implements TelloCommand {
  VideoStream videoStream;

  VideoStreamCommand(this.videoStream);

  @override
  String execute() {
    return videoStream == VideoStream.on ? "streamon" : "streamoff";
  }

  @override
  String getTitle() {
    return 'Have a look: udp://0.0.0.0:11111';
  }
}
