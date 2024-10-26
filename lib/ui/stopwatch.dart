import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:stopwatch_flutter/ui/stopwatch_renderer.dart';

class Stopwatch extends StatefulWidget {
  @override
  _StopwatchState createState() => _StopwatchState();
}

class _StopwatchState extends State<Stopwatch> with SingleTickerProviderStateMixin {
  late final Ticker ticker;
  Duration elapsedTime = Duration.zero;

  @override
  void initState() {
    super.initState();
    ticker = this.createTicker((elapsed) {
      elapsedTime = elapsed;
      setState(() {}); 
    });
    ticker.start();
  }

  dispose() {
    ticker.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StopwatchRenderer(
      elapsed: elapsedTime,
    );
  }
}
