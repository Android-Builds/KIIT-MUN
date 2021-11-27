import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:mun/ui/widgets/connectInternet.dart';
import 'package:mun/ui/pages/dashboard/contacts_page.dart';
import 'package:mun/ui/pages/dashboard/schedule.dart';
import 'package:mun/ui/widgets/app_drawer.dart';
import 'package:mun/ui/pages/dashboard/home_page.dart';
import 'package:mun/utils/constants.dart';
import 'package:mun/utils/themes.dart';

class DashBoard extends StatefulWidget {
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  int _selectedIndex = 0;
  late Connectivity connectivity;
  bool isOffline = false;
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

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
    super.initState();
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    darkMode = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return isOffline
        ? SafeArea(child: Scaffold(body: Connect(size: size)))
        : SafeArea(
            child: Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: Text(
                  'KIIT e-MUN',
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
