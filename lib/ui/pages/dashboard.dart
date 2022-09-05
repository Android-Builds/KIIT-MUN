import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity/connectivity.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:mun/ui/widgets/connectInternet.dart';
import 'package:mun/ui/pages/dashboard/contacts_page.dart';
import 'package:mun/ui/pages/dashboard/schedule.dart';
import 'package:mun/ui/widgets/app_drawer.dart';
import 'package:mun/ui/pages/dashboard/home_page.dart';
import 'package:mun/utils/constants.dart';
import 'package:mun/utils/themes.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../models/notification.dart';

class DashBoard extends StatefulWidget {
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  int _selectedIndex = 0;
  late Connectivity connectivity;
  bool isOffline = false;
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;
  CollectionReference tokens = FirebaseFirestore.instance.collection('tokens');

  static List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    Schedule(),
    ContactsPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  generateNotifications(RemoteMessage message) async {
    const AndroidNotificationChannel channel = AndroidNotificationChannel(
      'high_importance_channel', // id
      'High Importance Notifications', // title
      description:
          'This channel is used for important notifications.', // description
      importance: Importance.high,
      playSound: true,
      enableVibration: true,
    );

    final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();

    var initializationSettingsAndroid =
        AndroidInitializationSettings('@drawable/kiitmun');
    var initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);
    flutterLocalNotificationsPlugin.initialize(initializationSettings);

    flutterLocalNotificationsPlugin.initialize(initializationSettings);

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    RemoteNotification? notification = message.notification;
    AndroidNotification? android = message.notification?.android;

    if (notification != null && android != null) {
      flutterLocalNotificationsPlugin.show(
        notification.hashCode,
        notification.title,
        notification.body,
        NotificationDetails(
          android: AndroidNotificationDetails(
            channel.id,
            channel.name,
            channelDescription: channel.description,
            icon: '@drawable/kiitmun',
            enableVibration: true,
            playSound: true,
            enableLights: true,
            ongoing: false,
            importance: Importance.high,
            priority: Priority.high,
            visibility: NotificationVisibility.public,
            channelShowBadge: true,
            showWhen: true,
            // other properties...
          ),
        ),
      );
    }
  }

  Future<void> showPopup(RemoteMessage message, BuildContext context) {
    RemoteNotification? notification = message.notification;
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(notification!.title!),
          content: Text(notification.body!),
          actions: [
            TextButton(
              child: Text("Ok"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        );
      },
    );
  }

  initFirebaseMessaging(BuildContext context) {
    FirebaseMessaging.instance.getToken();
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      showPopup(message, context);
      generateNotifications(message);
    });
  }

  Future<void> _showDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          title: Text(
            'Star Performance',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: accentColor,
            ),
          ),
          content: Container(
            height: size.height * 0.3,
            child: Column(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    // child: CachedNetworkImage(
                    //   imageUrl:
                    //       'https://kiitmun.org/dev/assets/img/carousel/carousel8.jpg',
                    //   placeholder: (context, url) => Shimmer.fromColors(
                    //     child: Container(
                    //       height: size.height * 0.24,
                    //       width: size.width,
                    //       decoration: BoxDecoration(
                    //         color: Colors.grey,
                    //         borderRadius: BorderRadius.circular(10.0),
                    //       ),
                    //     ),
                    //     baseColor: Colors.grey,
                    //     highlightColor: Theme.of(context).scaffoldBackgroundColor,
                    //   ),
                    // ),
                    child: InkWell(
                        onTap: () => {
                              launch(
                                  "https://www.instagram.com/p/ChwO_P_KnA1/?igshid=MDJmNzVkMjY="),
                            },
                        child: Image.asset("assets/smaryain.png"))),
                Spacer(),
                Text(
                  '10th September. Mark your calenders !',
                  style: TextStyle(
                    fontSize: size.width * 0.035,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  void initState() {
    connectivity = new Connectivity();
    _connectivitySubscription =
        connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
      if (result == ConnectivityResult.wifi ||
          result == ConnectivityResult.mobile) {
        isOffline = false;
        setState(() {});
      } else {
        isOffline = true;
        setState(() {});
      }
    });
    initFirebaseMessaging(context);
    super.initState();
    Future(_showDialog);
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    NotificationService()
        .showNotification(1, "Mun Meet at 10", "Hello there", 10, 59);

    size = MediaQuery.of(context).size;
    darkMode = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return isOffline
        ? SafeArea(child: Scaffold(body: Connect(size: size)))
        : SafeArea(
            child: Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: Text(
                  'KIIT MUN 2022',
                  style: TextStyle(
                    fontSize: size.width * 0.045,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              drawer: AppDrawer(),
              body: Center(
                child: _widgetOptions.elementAt(_selectedIndex),
              ),
              bottomNavigationBar: BottomNavigationBar(
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.schedule),
                    label: 'Schedule',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.contact_phone),
                    label: 'Contacts',
                  ),
                ],
                currentIndex: _selectedIndex,
                selectedItemColor: accentColor,
                onTap: _onItemTapped,
              ),
            ),
          );
  }
}
