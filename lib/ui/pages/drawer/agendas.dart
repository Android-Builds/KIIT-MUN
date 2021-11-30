import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:mun/ui/widgets/Loader.dart';
import 'package:mun/ui/widgets/connectInternet.dart';
import 'package:mun/ui/widgets/list_poster.dart';
import 'package:mun/utils/themes.dart';

class Agendas extends StatefulWidget {
  @override
  _AgendasState createState() => _AgendasState();
}

class _AgendasState extends State<Agendas> {
  late Connectivity connectivity;
  bool isOffline = false;
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

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
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Agendas',
          style: TextStyle(
            fontSize: size.width * 0.04,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: isOffline
          ? Connect(size: size)
          : StreamBuilder(
              stream:
                  FirebaseFirestore.instance.collection("agendas").snapshots(),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting)
                  return Loader();
                else if (snapshot.hasData) {
                  Map agendas = snapshot.data.docs[0].data()['agendas'];
                  return agendaList(agendas, size);
                } else
                  return Center(child: Text('Error Fetching Data'));
              },
            ),
    );
  }

  agendaList(Map agendas, Size size) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      physics: BouncingScrollPhysics(),
      itemCount: agendas.length,
      itemBuilder: (context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                '${index + 1}. ' +
                    agendas['${index + 1}']
                        .toString()
                        .split('/')
                        .last
                        .split('.')
                        .first,
                style: TextStyle(
                  fontSize: size.width * 0.05,
                  color: accentColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListPoster(imageUrl: agendas['${index + 1}']),
          ],
        );
      },
    );
  }
}
