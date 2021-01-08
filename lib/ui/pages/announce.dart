import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mun/ui/widgets/Loader.dart';
import 'package:mun/ui/widgets/connectInternet.dart';
import 'package:mun/ui/widgets/updated.dart';
import 'dart:async';
import 'package:connectivity/connectivity.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:intl/intl.dart';

bool isOffline = false;

String readTimestamp(DateTime dateTime) {
  var now = new DateTime.now();
  var format = new DateFormat.jm();
  //var format2 = new DateFormat.MMMd('en_US');
  var diff = now.difference(dateTime);
  var time = '';

  // if (diff.inSeconds <= 0 ||
  //     diff.inSeconds > 0 && diff.inMinutes == 0 ||
  //     diff.inMinutes > 0 && diff.inHours == 0 ||
  //     diff.inHours > 0 && diff.inDays == 0) {
  // }
  if (diff.inDays > 0 && diff.inDays < 7) {
    if (diff.inDays == 1) {
      time = diff.inDays.toString() + ' day ago';
    } else {
      time = diff.inDays.toString() + ' days ago';
    }
  } else if (diff.inDays >= 7) {
    if (diff.inDays == 7) {
      time = (diff.inDays / 7).floor().toString() + ' week ago';
    } else {
      time = (diff.inDays / 7).floor().toString() + ' weeks ago';
    }
  } else {
    return 'Today' + ", " + format.format(dateTime);
  }
  return time;
}

class Announce extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Live Feed',
          style: TextStyle(
            fontSize: size.width * 0.04,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: AnnounceLoader(),
    );
  }
}

class AnnounceLoader extends StatefulWidget {
  @override
  _AnnounceLoaderState createState() => _AnnounceLoaderState();
}

class _AnnounceLoaderState extends State<AnnounceLoader> {
  Connectivity connectivity;
  StreamSubscription<ConnectivityResult> subscription;

  @override
  void initState() {
    super.initState();
    connectivity = new Connectivity();
    subscription =
        connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
      if (result == ConnectivityResult.wifi ||
          result == ConnectivityResult.mobile) {
        setState(() {
          isOffline = false;
        });
      } else {
        setState(() {
          isOffline = true;
        });
      }
    });
  }

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return isOffline
        ? Connect(size: size)
        : StreamBuilder(
            stream:
                FirebaseFirestore.instance.collection('announce').snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) return Loader();
              final int count = snapshot.data.documents.length;
              if (count == 0) return Updated();
              //print(snapshot.data.docs[0].data());
              //print('------------');
              var data = snapshot.data.docs.reversed.elementAt(0).data();
              return !data['isUpdated']
                  ? Updated()
                  : ListView.builder(
                      shrinkWrap: true,
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        final Map doc = data['announcements']['${index + 1}'];
                        return buildFeed(context, doc, size);
                      },
                    );
            },
          );
  }
}

Widget buildFeed(BuildContext context, var feedListItem, Size size) {
  double w = MediaQuery.of(context).size.width;
  String t = readTimestamp(feedListItem['time'].toDate());
  bool img = false;
  if (feedListItem['img'] != '' || feedListItem['img'] != null) {
    img = true;
  }
  return Container(
    margin: EdgeInsets.all(10.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(4.0),
    ),
    child: Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            Center(
              child: Text(
                feedListItem['title'],
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: size.width * 0.05,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 15),
            img
                ? Container(
                    padding: EdgeInsets.all(20.0),
                    width: size.width,
                    child: Center(
                      child: CachedNetworkImage(
                        imageUrl: feedListItem['img'],
                        placeholder: (context, url) =>
                            Center(child: CircularProgressIndicator()),
                      ),
                    ),
                  )
                : SizedBox.shrink(),
            SizedBox(height: 15),
            Text(
              feedListItem['value'],
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: size.width * 0.04),
            ),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.bottomRight,
              child: Text(
                'Time : ' + t,
                style: TextStyle(fontSize: size.width * 0.03),
              ),
            )
          ],
        ),
      ),
    ),
  );
}
