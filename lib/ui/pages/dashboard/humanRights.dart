import 'package:flutter/material.dart';

class HumanRights extends StatelessWidget {
  const HumanRights({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InteractiveViewer(
      panEnabled: true,
      maxScale: 4,
      minScale: 0.5,
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Image.asset("assets/Humanrights.png"),
      ),
    );
  }
}
