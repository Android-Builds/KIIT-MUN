import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:mun/ui/widgets/Loader.dart';
import 'dart:async';
import '../../widgets/connectInternet.dart';
import 'package:connectivity/connectivity.dart';

class ExecutiveBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Executive Board',
          style: TextStyle(
            fontSize: size.width * 0.04,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: LoadEB(),
    );
  }
}

class LoadEB extends StatefulWidget {
  @override
  _LoadEBState createState() => _LoadEBState();
}

class _LoadEBState extends State<LoadEB> {
  Connectivity connectivity;
  bool isOffline = false;
  StreamSubscription<ConnectivityResult> _connectivitySubscription;

  @override
  void initState() {
    super.initState();
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
            stream: FirebaseFirestore.instance
                .collection("Executive Board")
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Loader();
              } else if (snapshot.hasData) {
                Map board = snapshot.data.docs[0].data();
                return boardlist(board, size.width);
              } else {
                return Center(
                  child: Text('Error fetching details'),
                );
              }
            },
          );
  }

  Widget boardlist(Map board, double width) {
    return ListView.builder(
      padding: EdgeInsets.all(10.0),
      itemCount: board.length,
      itemBuilder: (context, index) {
        return Card(
          child: ExpansionTile(
            title: Text(
              board.keys.elementAt(index),
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: CachedNetworkImage(
                    imageUrl: board.values
                        .elementAt(index)
                        .values
                        .elementAt(board.values.elementAt(index).length - 1),
                    width: width,
                    placeholder: (context, url) => Container(
                      height: 60.0,
                      alignment: Alignment.center,
                      child: CircularProgressIndicator(),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'Board Members',
                  style: TextStyle(
                    fontSize: width * 0.05,
                    fontWeight: FontWeight.bold,
                    color: Colors.green[300],
                  ),
                ),
              ),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.all(20.0),
                shrinkWrap: true,
                itemCount: board.values.elementAt(index).length - 1,
                itemBuilder: (context, innerIndex) {
                  return Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        SizedBox(
                          width: width * 0.5,
                          child: RichText(
                            text: TextSpan(
                              text: board.values.elementAt(index)[
                                      'member${innerIndex + 1}']['name'] +
                                  '\n',
                              style:
                                  DefaultTextStyle.of(context).style.copyWith(
                                        fontSize: 16.0,
                                      ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: board.values.elementAt(index)[
                                      'member${innerIndex + 1}']['designation'],
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13.0,
                                    color: Colors.green[300],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: width / 4,
                          height: width / 4,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50.0),
                            child: CachedNetworkImage(
                              fit: BoxFit.cover,
                              imageUrl: board.values.elementAt(
                                  index)['member${innerIndex + 1}']['imageUrl'],
                              placeholder: (context, url) => Center(
                                child: CircularProgressIndicator(),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
