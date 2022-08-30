import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mun/ui/pages/drawer/pdf_viewer/view_pdf.dart';
import 'package:mun/ui/widgets/Loader.dart';
import 'package:mun/ui/widgets/connectInternet.dart';
import 'package:mun/utils/constants.dart';
import 'package:mun/utils/themes.dart';

class StudyGuide extends StatefulWidget {
  @override
  _StudyGuideState createState() => _StudyGuideState();
}

class _StudyGuideState extends State<StudyGuide> {
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
            'Study Guide',
            style: TextStyle(
              fontSize: size.width * 0.04,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: isOffline ? Connect(size: size) : commiteeList(size)
        // StreamBuilder(
        //     stream: FirebaseFirestore.instance
        //         .collection("study_guide")
        //         .snapshots(),
        //     builder: (context, AsyncSnapshot snapshot) {
        //       if (snapshot.connectionState == ConnectionState.waiting)
        //         return Loader();
        //       else if (snapshot.hasData) {
        //         Map doc = snapshot.data.docs[0].data()['guides'];
        //         return commiteeList(doc, size);
        //       } else
        //         return Center(child: Text('Error Fetching Data'));
        //     },
        //   ),
        );
  }

  Widget commiteeList(Size size) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      controller: ScrollController(),
      padding: EdgeInsets.all(10.0),
      itemCount: committeeNames.length,
      itemBuilder: (context, index) {
        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: ListTile(
            onTap: () => studyGuide[index] != ""
                ? Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ViewPdf(
                        url: studyGuide[index],
                        name: committeeNames[index],
                      ),
                    ),
                  )
                : {},
            contentPadding: EdgeInsets.symmetric(
              horizontal: 30.0,
              vertical: 10.0,
            ),
            leading: Text('${index + 1}.'),
            title: Text(
              committeeNames[index],
              style: TextStyle(
                color: accentColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              fullForms[index],
              style: TextStyle(fontSize: size.width * 0.03),
            ),
          ),
        );
      },
    );
  }
}
