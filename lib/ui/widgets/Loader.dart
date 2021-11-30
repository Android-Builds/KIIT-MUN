import 'package:flutter/material.dart';
import 'package:mun/utils/constants.dart';
import 'package:mun/utils/themes.dart';

class Loader extends StatefulWidget {
  @override
  _LoaderState createState() => _LoaderState();
}

class _LoaderState extends State<Loader> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Image.asset('assets/mun_loader.gif'),
            Text(
              'Loading...',
              style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
                color: accentColor,
              ),
            ),
            Text(
              tagLine,
              style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
                color: accentColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
