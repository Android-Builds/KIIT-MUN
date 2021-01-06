import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mun/ui/widgets/Loader.dart';
import 'package:mun/ui/widgets/updated.dart';
import '../../widgets/connectInternet.dart';
import 'package:connectivity/connectivity.dart';

class Sponsors extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sponsors',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: size.width * 0.04,
          ),
        ),
      ),
      body: LoadSponsors(),
    );
  }
}

class LoadSponsors extends StatefulWidget {
  @override
  _LoadSponsorsState createState() => _LoadSponsorsState();
}

class _LoadSponsorsState extends State<LoadSponsors> {
  Connectivity connectivity;
  bool isOffline = false;
  StreamSubscription<ConnectivityResult> _connectivitySubscription;

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
    return isOffline
        ? Connect(size: size)
        : StreamBuilder(
            stream:
                FirebaseFirestore.instance.collection("sponsors").snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Loader();
              } else if (snapshot.hasData) {
                Map sponsors = snapshot.data.docs[0].data();
                return sponsors['isUpdated']
                    ? sponsorList(sponsors.values.elementAt(0))
                    : Updated();
              } else {
                return Center(
                  child: Text('Error fetching details'),
                );
              }
            },
          );
  }

  sponsorList(Map sponsors) {
    final size = MediaQuery.of(context).size;
    return GridView.count(
      crossAxisCount: 2,
      children: List.generate(sponsors.length, (index) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              sponsors.keys.elementAt(index),
              style: TextStyle(
                fontSize: size.width * 0.035,
                fontWeight: FontWeight.bold,
                color: Colors.green[300],
              ),
            ),
            SizedBox(height: 20),
            Container(
              height: size.height / 8,
              width: size.height / 8,
              child: Center(
                child: CachedNetworkImage(
                  imageUrl: sponsors.values.elementAt(index)['image'],
                  placeholder: (context, url) => CircularProgressIndicator(),
                ),
              ),
            ),
            SizedBox(height: 10),
            Center(
              child: Text(
                sponsors.values.elementAt(index)['name'],
                style: TextStyle(
                  fontSize: size.width * 0.03,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20),
          ],
        );
      }),
    );
  }
}
