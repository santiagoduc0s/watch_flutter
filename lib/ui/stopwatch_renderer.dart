import 'dart:math';
import 'package:flutter/material.dart';
import 'package:stopwatch_flutter/ui/clock_hand.dart';
import 'package:stopwatch_flutter/ui/elapsed_time_text.dart';

class StopwatchRenderer extends StatelessWidget {
  const StopwatchRenderer({
    super.key,
    required this.elapsed,
  });

  final Duration elapsed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: AspectRatio(
        aspectRatio: 1.0,
        child: LayoutBuilder(
          builder: (context, constraints) {
            final stackWidth = constraints.maxWidth;

            return Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.indigo.shade700,
                      width: 10.0,
                    ),
                  ),
                ),
                Positioned(
                  left: stackWidth * 0.5,
                  top: stackWidth * 0.5,
                  child: ClockHand(
                    rotationZAngle:
                        pi + (2 * pi / 60000) * elapsed.inMilliseconds,
                    handWidth: 10.0,
                    handLength: stackWidth * 0.5,
                    handColor: Colors.orange,
                  ),
                ),
                Positioned.fromRect(
                  rect: Rect.fromLTWH(0, 0, stackWidth, stackWidth * 1.5),
                  child: ElapsedTimeText(
                    elapsed: elapsed,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
