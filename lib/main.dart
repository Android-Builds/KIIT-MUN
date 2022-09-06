import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mun/models/notification.dart';
import 'package:mun/ui/pages/dashboard.dart';
import 'package:mun/utils/constants.dart';
import 'package:mun/utils/themes.dart';

initTime() {
  now = DateTime.now();
  if (now.compareTo(eventDate) > 0) done = true;
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
      theme: lightTheme,
      title: "KIIT MUN",
      darkTheme: darkTheme,
      home: DashBoard(),
    );
  }
}
