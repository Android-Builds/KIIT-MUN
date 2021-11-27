import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:mun/ui/pages/dashboard/schedule/tab.dart';
import 'package:mun/ui/widgets/Loader.dart';
import 'package:mun/ui/widgets/updated.dart';

class Schedule extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection("schedule").snapshots(),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Loader();
        } else if (snapshot.hasData) {
          Map event = snapshot.data.docs[0].data();
          return event['isUpdated'] ? body(event['schedule']) : Updated();
        } else {
          return Center(
            child: Text('Error fetching details'),
          );
        }
      },
    );
  }

  Widget body(Map event) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: TabBar(
          tabs: [
            Tab(text: 'Friday'),
            Tab(text: 'Saturday'),
            Tab(text: 'Sunday'),
          ],
        ),
        body: TabBarView(
          children: <Widget>[
            ScheduleTab(event: event['Friday']),
            ScheduleTab(event: event['Saturday']),
            ScheduleTab(event: event['Sunday']),
          ],
        ),
      ),
    );
  }
}
