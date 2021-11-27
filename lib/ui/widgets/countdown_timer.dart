import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mun/utils/constants.dart';

class CountDownTimer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _CountDownTimerState();
}

class _CountDownTimerState extends State<CountDownTimer> {
  Timer? t;

  initTime() {
    now = DateTime.now();
    days = eventDate.difference(now).inDays;
    hours = eventDate.difference(now).inHours % 24;
    minutes = eventDate.difference(now).inMinutes % 60;
    seconds = eventDate.difference(now).inSeconds % 60;
  }

  updateTime() {
    seconds = seconds! - 1;
    if (seconds == -1) {
      minutes = minutes! - 1;
      seconds = 59;
    }
    if (minutes == -1) {
      hours = hours! - 1;
      minutes = 59;
    }
    if (hours == -1) {
      days = days! - 1;
      hours = 23;
    }
  }

  @override
  void initState() {
    initTime();
    super.initState();
  }

  @override
  void dispose() {
    if (t != null && t!.isActive) {
      t!.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Stream.periodic(Duration(seconds: 1), (i) => i),
      builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
        updateTime();
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Event Live in',
              style: GoogleFonts.robotoCondensed(
                fontSize: 25.0,
                color: Colors.red[300],
              ),
            ),
            SizedBox(height: 30),
            RichText(
              text: TextSpan(
                text: days.toString().length < 2
                    ? days.toString().padLeft(2, '0')
                    : '$days',
                style: GoogleFonts.robotoCondensed(
                  fontSize: 35.0,
                  color: Colors.red[300],
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: ' : ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                  TextSpan(
                    text: hours.toString().length < 2
                        ? hours.toString().padLeft(2, '0')
                        : '$hours',
                  ),
                  TextSpan(
                    text: ' : ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                  TextSpan(
                    text: minutes.toString().length < 2
                        ? minutes.toString().padLeft(2, '0')
                        : '$minutes',
                  ),
                  TextSpan(
                    text: ' : ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                  TextSpan(
                    text: seconds.toString().length < 2
                        ? seconds.toString().padLeft(2, '0')
                        : '$seconds',
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
