import 'dart:collection';

import 'api/tello_command.dart';

class CommandHistory {
  final ListQueue<TelloCommand> _commandList = ListQueue<TelloCommand>();

  bool get isEmpty => _commandList.isEmpty;
  List<String> get commandHistoryList =>
      _commandList.map((c) => c.getTitle()).toList();

  void add(TelloCommand command) {
    _commandList.add(command);
  }
}
