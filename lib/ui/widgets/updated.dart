import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mun/utils/constants.dart';
import 'package:mun/utils/themes.dart';

class Updated extends StatefulWidget {
  @override
  _UpdatedState createState() => _UpdatedState();
}

class _UpdatedState extends State<Updated> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          SizedBox.shrink(),
          LottieBuilder.asset(
            'assets/coming_soon.json',
            height: size.height * 0.22,
          ),
          Text(
            'To be Updated Soon ..',
            style: TextStyle(
              fontSize: size.width * 0.04,
              fontWeight: FontWeight.bold,
              color: accentColor,
            ),
          ),
          //SizedBox(height:40),
          Text(
            tagLine,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: size.width * 0.035,
              fontWeight: FontWeight.bold,
              color: accentColor,
            ),
          ),
        ],
      ),
    );
  }
}
