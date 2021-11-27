import 'dart:async';
import 'package:flip_panel/flip_panel.dart';
import 'package:flutter/material.dart';
import 'package:mun/utils/constants.dart';

class FlipTimer extends StatefulWidget {
  final StreamController controller;

  const FlipTimer({
    Key? key,
    required this.controller,
  }) : super(key: key);
  @override
  _FlipTimerState createState() => _FlipTimerState();
}

class _FlipTimerState extends State<FlipTimer> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FlipClock.reverseCountdown(
      onDone: () {
        valueNotifier.value = true;
      },
      duration: Duration(
        days: days!,
        hours: hours!,
        minutes: minutes!,
        seconds: seconds!,
      ),
      digitColor: Colors.black,
      backgroundColor: Colors.white,
      digitSize: 25.0,
    );
  }
}
