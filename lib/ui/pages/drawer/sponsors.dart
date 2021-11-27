import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
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
    return isOffline
        ? Connect(size: size)
        : StreamBuilder(
            stream:
                FirebaseFirestore.instance.collection("sponsors").snapshots(),
            builder: (context, AsyncSnapshot snapshot) {
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
    return GridView.count(
      padding: EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 10.0,
      ),
      crossAxisCount: 2,
      children: List.generate(sponsors.length, (index) {
        return Container(
          padding: const EdgeInsets.all(10.0),
          margin: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: CachedNetworkImage(
            imageUrl: sponsors['${index + 1}'],
            placeholder: (context, url) =>
                Center(child: CircularProgressIndicator()),
          ),
        );
      }),
    );
  }
}
