import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mun/ui/widgets/updated.dart';
import '../../widgets/connectInternet.dart';
import 'package:connectivity/connectivity.dart';

var loading;
var isOffline = false;

class Partners extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Partners',
          style: TextStyle(
            fontSize: size.width * 0.04,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: LoadPartners(),
    );
  }
}

class LoadPartners extends StatefulWidget {
  @override
  _LoadPartnersState createState() => _LoadPartnersState();
}

class _LoadPartnersState extends State<LoadPartners> {
  Connectivity connectivity;
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
                FirebaseFirestore.instance.collection("partners").snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasData) {
                Map partners = snapshot.data.docs[0].data();
                return partners['isUpdated']
                    ? partnerList(partners.values.elementAt(0))
                    : Updated();
              } else {
                return Center(
                  child: Text('Error fetching details'),
                );
              }
            },
          );
  }

  partnerList(Map partners) {
    return GridView.count(
      padding: EdgeInsets.all(10.0),
      crossAxisCount: 3,
      children: List.generate(partners.length, (index) {
        return Container(
          margin: EdgeInsets.all(10.0),
          padding: EdgeInsets.all(5.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: CachedNetworkImage(
            imageUrl: partners.values.elementAt(index),
          ),
        );
      }),
    );
  }
}
