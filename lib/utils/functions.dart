import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vibration/vibration.dart';

launchError(BuildContext context) async {
  if (await Vibration.hasVibrator()) {
    Vibration.vibrate(duration: 200);
  }
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      content: Text('No suitable app found to perform this operation'),
      action: SnackBarAction(
        label: 'Dismiss',
        onPressed: () => ScaffoldMessenger.of(context).removeCurrentSnackBar(),
      ),
    ),
  );
}
