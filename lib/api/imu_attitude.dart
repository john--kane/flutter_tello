class ImuAttitude {
  final int pitch;
  final int roll;
  final int yaw;

  const ImuAttitude(this.pitch, this.roll, this.yaw);

  @override
  String toString() => "$ImuAttitude(pitch: $pitch, roll: $roll, yaw: $yaw)";
}
