import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mun/ui/widgets/connectInternet.dart';

class CommittePage extends StatefulWidget {
  @override
  _CommittePageState createState() => _CommittePageState();
}

class _CommittePageState extends State<CommittePage> {
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
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Committees',
          style: TextStyle(
            fontSize: size.width * 0.04,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: isOffline
          ? Connect(size: size)
          : StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("committees")
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting)
                  return Center(child: CircularProgressIndicator());
                else if (snapshot.hasData) {
                  Map doc = snapshot.data.docs[0].data();
                  //print(doc);
                  return commiteeList(doc, size);
                } else
                  return Center(child: Text('Error Fetching Data'));
              },
            ),
    );
  }

  Widget commiteeList(Map map, Size size) {
    return ListView.builder(
      controller: ScrollController(),
      padding: EdgeInsets.all(10.0),
      itemCount: map.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            onTap: () => _showDescription(
                context,
                map.values.elementAt(index)['about'],
                map.values.elementAt(index)['agenda'],
                map.values.elementAt(index)['poster'],
                size),
            contentPadding: EdgeInsets.only(
              top: 10.0,
              bottom: 10.0,
              right: 15.0,
            ),
            leading: CachedNetworkImage(
              imageUrl: map.values.elementAt(index)['logo'],
              height: size.width * 0.2,
              width: size.width * 0.2,
            ),
            title: Text(
              map.keys.elementAt(index) + '\n',
              style: TextStyle(
                color: Colors.green[300],
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  map.values.elementAt(index)['fullForm'],
                  style: TextStyle(fontSize: size.width * 0.033),
                ),
                SizedBox(height: 20.0),
                Row(
                  children: [
                    Text(
                      'Level: ${map.values.elementAt(index)['level']}',
                      style: TextStyle(fontSize: size.width * 0.03),
                    ),
                    Spacer(),
                    Text(
                      'Delegate: ${map.values.elementAt(index)['delegate']}',
                      style: TextStyle(fontSize: size.width * 0.03),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                Text(
                  'Max Allotment: ${map.values.elementAt(index)['maxAllotment']}',
                  style: TextStyle(fontSize: size.width * 0.03),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showDescription(
    context,
    String description,
    String agenda,
    String poster,
    Size size,
  ) {
    bool display = false;
    if (agenda != '') {
      display = true;
    }
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(10.0),
          topLeft: Radius.circular(10.0),
        ),
      ),
      builder: (BuildContext bc) {
        return ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: size.height * 0.8,
          ),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: <Widget>[
                SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 20.0,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: CachedNetworkImage(
                      imageUrl: poster,
                      height: size.height * 0.3,
                      width: size.width,
                      fit: BoxFit.fill,
                      placeholder: (context, url) =>
                          Center(child: CircularProgressIndicator()),
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
                display
                    ? ListTile(
                        leading: Icon(
                          Icons.star,
                          color: Color(0xFFd4af37),
                        ),
                        title: Text(
                          "Agenda\n",
                          style: TextStyle(
                            fontSize: 14.0,
                          ),
                        ),
                        subtitle: Text(
                          agenda + "\n",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 13.0,
                          ),
                        ),
                        onTap: () => Navigator.of(context).pop(),
                      )
                    : SizedBox.shrink(),
                ListTile(
                  leading: Icon(
                    Icons.book,
                    color: Color(0xFFd4af37),
                  ),
                  title: Text(
                    "About\n",
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                  subtitle: Text(
                    description + "\n",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 12.0,
                    ),
                  ),
                  onTap: () => Navigator.of(context).pop(),
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
        );
      },
    );
  }
}
