import 'package:flutter/material.dart';

class ClockHand extends StatelessWidget {
  const ClockHand({
    super.key,
    required this.rotationZAngle,
    required this.handWidth,
    required this.handLength,
    required this.handColor,
  });

  final double rotationZAngle;
  final double handWidth;
  final double handLength;
  final Color handColor;

  @override
  Widget build(BuildContext context) {
    return Transform(
      alignment: Alignment.topCenter,
      transform: Matrix4.identity()
        ..translate(-handWidth * 0.5, 0, 0)
        ..rotateZ(rotationZAngle),
      child: Container(
        height: handLength,
        width: handWidth,
        color: handColor,
      ),
    );
  }
}
