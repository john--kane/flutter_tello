import 'dart:io';

import 'package:flutter_tello/flutter_tello.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  var tello = Tello(configuration: TelloConfiguration(telloAddress: InternetAddress.anyIPv4.toString()));
  setUp(() async => await tello.setup());

  test('Create a tello instance', () {
    expect(tello.configuration.telloAddress, InternetAddress.anyIPv4.toString());
    expect(tello.configuration.receivePort, 9000);
    expect(tello.configuration.telloPort, 8889);
  });

  tearDown(() async => await tello.destroy());
}
