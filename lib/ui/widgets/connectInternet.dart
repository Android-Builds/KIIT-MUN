import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Connect extends StatefulWidget {
  final Size? size;

  const Connect({Key? key, this.size}) : super(key: key);
  @override
  _ConnectState createState() => _ConnectState();
}

class _ConnectState extends State<Connect> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          LottieBuilder.asset(
            'assets/nc.json',
            height: widget.size!.width * 0.5,
            width: widget.size!.width * 0.5,
          ),
          Text(
            'No Internet / Poor Connection\n\nPlease connect to the Internet!',
            textAlign: TextAlign.center,
            style: TextStyle(
              //fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: Colors.green[300],
            ),
          ),
        ],
      ),
    );
  }
}
