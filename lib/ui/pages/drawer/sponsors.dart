import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mun/ui/widgets/Loader.dart';
import 'package:mun/ui/widgets/flip_tile.dart';
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

List<String> sponsorsLogo = [
  "https://kiitmun.org/assets/img/sponsers/VIP%20Identity%20Color%20CMYK_page-0001.jpg",
  "https://kiitmun.org/assets/img/sponsers/Nikon%20Logo.png",
  "https://kiitmun.org/assets/img/sponsers/East%20Outdoor%20Logo%20for%20Light%20Backdrop_page-0001.jpg",
  "https://kiitmun.org/assets/img/sponsers/Lakme'.jpg",
  "https://kiitmun.org/assets/img/sponsers/Drunken%20Monkey.png",
  "https://kiitmun.org/assets/img/sponsers/UNI%20STREET%20LOGO%204.jpg",
  "https://kiitmun.org/assets/img/sponsers/Badelog%20black.png",
  "https://kiitmun.org/assets/img/sponsers/GrabOn_-_Official_Logo.png",
  "https://kiitmun.org/assets/img/sponsers/mediakart.png",
  "https://kiitmun.org/assets/img/sponsers/barah%20baj%20gaye.jpg",
  "https://kiitmun.org/assets/img/sponsers/logo.png",
  "https://kiitmun.org/assets/img/sponsers/Pritam.jpg",
];

List<String> sponsorType = [
  "Associate Partner",
  "Photography Partner",
  "Radio Partner",
  "Salon Partner",
  "Munchies Partner",
  "Merchandise Partner",
  "Lifestyle Partner",
  "Saving Partner",
  "Health and Wellness Partner",
  "Cuisine Partner",
  "Education Partner",
  "Outfit Partner",
];

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
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: sponsors.length,
      itemBuilder: (context, index) {
        return Container(
          padding: const EdgeInsets.all(10.0),
          margin: EdgeInsets.symmetric(
            horizontal: 30.0,
            vertical: 10.0,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: FlipTile(
            imageUrl: sponsorsLogo[index],
            type: sponsorType[index],
          ),
        );
      },
    );
  }
}
