import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mun/ui/pages/drawer/pdf_viewer/view_pdf.dart';
import 'package:mun/ui/widgets/Loader.dart';
import 'package:mun/ui/widgets/connectInternet.dart';

class StudyGuide extends StatefulWidget {
  @override
  _StudyGuideState createState() => _StudyGuideState();
}

class _StudyGuideState extends State<StudyGuide> {
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
          'Study Guide',
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
                  .collection("study_guide")
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting)
                  return Loader();
                else if (snapshot.hasData) {
                  Map doc = snapshot.data.docs[0].data()['guides'];
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
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ViewPdf(
                          url: map.values.elementAt(index)['docUrl'],
                          name: map.values.elementAt(index)['name'],
                        ))),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 30.0,
              vertical: 10.0,
            ),
            leading: Text('${index + 1}.'),
            title: Text(
              map.values.elementAt(index)['name'],
              style: TextStyle(
                color: Colors.green[300],
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              map.values.elementAt(index)['fullForm'],
              style: TextStyle(fontSize: size.width * 0.03),
            ),
          ),
        );
      },
    );
  }
}
