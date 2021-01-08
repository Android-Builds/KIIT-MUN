import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mun/ui/pages/dashboard.dart';
import 'package:mun/utils/constants.dart';
import 'package:mun/utils/themes.dart';

initTime() {
  now = DateTime.now();
  days = eventDate.difference(now).inDays;
  hours = eventDate.difference(now).inHours % 24;
  minutes = eventDate.difference(now).inMinutes % 60;
  seconds = eventDate.difference(now).inSeconds % 60;
  if (days < 0 && hours < 0 && minutes < 0 && seconds < 0) done = true;
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  initTime();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'KIIT MUN',
      theme: lightTheme,
      darkTheme: darkTheme,
      home: DashBoard(),
    );
  }
}
