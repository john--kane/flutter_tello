import 'package:flutter_tello/api/imu_acceleration.dart';
import 'package:flutter_tello/api/imu_attitude.dart';
import 'package:flutter_tello/api/imu_velocity.dart';

class TelloState {
  final ImuAttitude imuAttitude;
  final ImuVelocity imuVelocity;
  final double averageTemperature;
  final int distanceFromTakeoff;
  final int height;
  final int battery;
  final double barometerReading;
  final int flightTime;
  final ImuAcceleration imuAcceleration;

  const TelloState(
    this.imuAttitude,
    this.imuVelocity,
    this.imuAcceleration,
    this.averageTemperature,
    this.distanceFromTakeoff,
    this.height,
    this.battery,
    this.barometerReading,
    this.flightTime,
  );

  @override
  String toString() => "$TelloState\n(\n\t${{
        "imuAttitude": imuAttitude,
        "imuVelocity": imuVelocity,
        "imuAcceleration": imuAcceleration,
        "averageTemperature": averageTemperature,
        "distanceFromTakeoff": distanceFromTakeoff,
        "height": height,
        "battery": battery,
        "barometerReading": barometerReading,
        "flightTime": flightTime,
      }.entries.map((element) => '${element.key}: ${element.value}').join('\n\t')}\n)";
}
