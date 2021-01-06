import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Updated extends StatefulWidget {
  @override
  _UpdatedState createState() => _UpdatedState();
}

class _UpdatedState extends State<Updated> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          LottieBuilder.asset('assets/coming_soon.json'),
          Text(
            'To be Updated Soon ..',
            style: TextStyle(
              fontSize: size.width * 0.04,
              fontWeight: FontWeight.bold,
              color: Colors.green[300],
            ),
          ),
          //SizedBox(height:40),
          Text(
            '#VoicesAgainstVices',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: size.width * 0.035,
              fontWeight: FontWeight.bold,
              color: Colors.green[300],
            ),
          ),
        ],
      ),
    );
  }
}
