import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:mun/ui/pages/dashboard/schedule/tab.dart';

class Schedule extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
            ScheduleTab(queryString: 'Friday'),
            ScheduleTab(queryString: 'Saturday'),
            ScheduleTab(queryString: 'Sunday'),
          ],
        ),
      ),
    );
  }
}
