import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mun/ui/widgets/Loader.dart';
import 'package:mun/ui/widgets/updated.dart';
import 'package:mun/utils/constants.dart';
import 'package:shimmer/shimmer.dart';
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
          'Collaborators',
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
  late Connectivity connectivity;
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
    return isOffline ? Connect(size: size) : partnerList();
    // StreamBuilder(
    //     stream:
    //         FirebaseFirestore.instance.collection("partners").snapshots(),
    //     builder: (context, AsyncSnapshot snapshot) {
    //       if (snapshot.connectionState == ConnectionState.waiting) {
    //         return Loader();
    //       } else if (snapshot.hasData) {
    //         Map partners = snapshot.data.docs[0].data();
    //         return partners['isUpdated']
    //             ?
    //             : Updated();
    //       } else {
    //         return Center(
    //           child: Text('Error fetching details'),
    //         );
    //       }
    //     },
    //   );
  }

  partnerList() {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: collabs.length,
      itemBuilder: (context, index) {
        return Container(
          padding: EdgeInsets.all(10.0),
          margin: EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 10.0,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            // child: CachedNetworkImage(
            //   imageUrl: collabs[index],
            //   placeholder: (context, url) => Shimmer.fromColors(
            //     child: Container(
            //       height: size.height * 0.32,
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
            child: Container(
              height: size.height * 0.32,
              width: size.width,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(collabs[index])),
              ),
            ),
          ),
        );
      },
    );
  }
}
