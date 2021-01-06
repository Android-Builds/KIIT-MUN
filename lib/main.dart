import 'package:connectivity/connectivity.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mun/ui/widgets/connectInternet.dart';
import 'package:mun/ui/pages/dashboard.dart';
import 'package:mun/utils/constants.dart';
import 'package:mun/utils/themes.dart';

initTime() {
  now = DateTime.now();
  days = eventDate.difference(now).inDays;
  hours = eventDate.difference(now).inHours % 24;
  minutes = eventDate.difference(now).inMinutes % 60;
  seconds = eventDate.difference(now).inSeconds % 60;
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
      title: 'Stag Walls',
      theme: lightTheme,
      darkTheme: darkTheme,
      home: DashBoard(),
    );
  }
}

// class SplashScreen extends StatefulWidget {
//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   checkConnection() async {
//     Connectivity connectivity = Connectivity();
//     bool connected =
//         await connectivity.checkConnectivity() != ConnectivityResult.none;
//     Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(
//           builder: (context) => DashBoard(
//             connected: connected,
//           ),
//         ));
//   }

//   @override
//   void initState() {
//     checkConnection();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Image.asset(
//           'assets/kiitMUN.png',
//           height: 150,
//           width: 150,
//         ),
//       ),
//     );
//   }
// }

// class DisConncted extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Connect(size: MediaQuery.of(context).size),
//     );
//   }
// }
