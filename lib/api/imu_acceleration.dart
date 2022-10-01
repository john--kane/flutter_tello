class ImuAcceleration {
  final double xAcceleration;
  final double yAcceleration;
  final double zAcceleration;

  const ImuAcceleration(this.xAcceleration, this.yAcceleration, this.zAcceleration);

  @override
  String toString() => "$ImuAcceleration(xAcceleration: $xAcceleration, yAcceleration: $yAcceleration, zAcceleration: $zAcceleration)";
}
