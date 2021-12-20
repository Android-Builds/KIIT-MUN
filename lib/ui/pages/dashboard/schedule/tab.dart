import 'package:flutter/material.dart';

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
    print(event['1']['endTime']);
    return ListView.builder(
      physics: BouncingScrollPhysics(),
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
                  event['${index + 1}']['event'],
                  style: TextStyle(
                    fontSize: 13.0,
                    fontWeight: FontWeight.bold,
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
                  event['${index + 1}']['startTime'] +
                      ' - ' +
                      event['${index + 1}']['endTime'],
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
