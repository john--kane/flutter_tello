class ImuVelocity {
  final int xVelocity;
  final int yVelocity;
  final int zVelocity;

  const ImuVelocity(this.xVelocity, this.yVelocity, this.zVelocity);

  @override
  String toString() => "$ImuVelocity(xVelocity: $xVelocity, yVelocity: $yVelocity, zVelocity: $zVelocity)";
}
