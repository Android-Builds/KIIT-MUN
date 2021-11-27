import 'package:flutter/material.dart';
import 'package:mun/utils/functions.dart';
import 'package:url_launcher/url_launcher.dart';

class ScheduleTab extends StatefulWidget {
  final Map? event;
  const ScheduleTab({
    Key? key,
    required this.event,
  }) : super(key: key);
  @override
  _ScheduleTabState createState() => _ScheduleTabState();
}

class _ScheduleTabState extends State<ScheduleTab> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return eventList(widget.event!);
  }

  Widget eventList(Map event) {
    return ListView.builder(
      padding: EdgeInsets.all(10.0),
      itemCount: event.length,
      itemBuilder: (context, index) {
        return Card(
          child: Column(
            children: <Widget>[
              ListTile(
                leading: Icon(
                  Icons.event,
                  color: Colors.green,
                ),
                title: Text(
                  'Event',
                  style: TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  event.keys.elementAt(index),
                  style: TextStyle(
                    fontSize: 13.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ListTile(
                onTap: () async {
                  var url = event.values.elementAt(0).values.elementAt(2);
                  if (await canLaunch(url))
                    launch(url);
                  else
                    launchError(context);
                },
                leading: Icon(
                  Icons.navigation,
                  color: Colors.green,
                ),
                title: Text(
                  'Join event',
                  style: TextStyle(
                    fontSize: 13.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  'Tap to join',
                  style: TextStyle(
                    fontSize: 11.0,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.timer,
                  color: Colors.green,
                ),
                title: Text(
                  'Time',
                  style: TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  event.values.elementAt(0).values.elementAt(0) +
                      ' - ' +
                      event.values.elementAt(0).values.elementAt(1),
                  style: TextStyle(
                    fontSize: 13.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
