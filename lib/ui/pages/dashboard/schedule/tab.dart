import 'package:flutter/material.dart';

class ScheduleTab extends StatefulWidget {
  final String day;
  const ScheduleTab({
    Key? key,
    required this.day,
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

  List<String> fridayEventName = [
    "Delegate Kit Distribution",
    "Conference Declaration",
    "Session 1",
    "Lunch",
    "Session 2",
    "High Tea",
    "Inauguration and Cultural Night"
  ];
  List<String> fridayEventLocation = [
    "Campus 6 Auditorium",
    "Campus 6 Auditorium",
    "Respective Council Room",
    "Respective Food Courts, Central Canteen",
    "Respective Council Room",
    "Respective Council Room",
    "Campus 6 Auditorium",
  ];
  List<String> fridayEventStartTime = [
    "07:00AM",
    "10:00AM",
    "10:30AM",
    "01:30PM",
    "03:00PM",
    "05:15PM",
    "06:00PM"
  ];
  List<String> fridayEventEndTime = [
    "10:00AM",
    "10:30AM",
    "01:30PM",
    "02:30PM",
    "05:00PM",
    "05:45PM",
    "08:00PM",
  ];

  List<String> saturdayEventName = [
    "Session 3",
    "Tea Break",
    "Session 4",
    "Lunch",
    "Session 5",
    "High Tea",
  ];
  List<String> saturdayEventLocation = [
    "Respective Council Room",
    "Respective Council Room",
    "Respective Council Room",
    "Respective Food Courts, Central Canteen",
    "Respective Council Room",
    "Respective Council Room",
  ];
  List<String> saturdayEventStartTime = [
    "08:00AM",
    "11:00AM",
    "11:15AM",
    "02:00PM",
    "02:00PM",
    "05:30PM",
  ];
  List<String> saturdayEventEndTime = [
    "11:00AM",
    "11:15AM",
    "11:15AM",
    "03:00PM",
    "05:30PM",
    "05:30PM",
  ];

  List<String> sundayEventName = [
    "Session 6",
    "Short Break",
    "Session 7",
    "Lunch",
    "Session 8",
    "High Tea",
    "Closing & Valedictory Ceremony",
  ];
  List<String> sundayEventLocation = [
    "Respective Council Room",
    "Respective Council Room",
    "Respective Council Room",
    "Respective Food Courts, Central Canteen",
    "Respective Council Room",
    "Respective Council Room",
    "Campus 6 Auditorium",
  ];
  List<String> sundayEventStartTime = [
    "08:00AM",
    "11:00AM",
    "11.15AM",
    "02:00PM",
    "03:00PM",
    "05:30PM",
    "06:00PM",
  ];
  List<String> sundayEventEndTime = [
    "11:00AM",
    "11:15AM",
    "02:00AM",
    "03:00PM",
    "05:30PM",
    "05:45PM",
    "08:00PM",
  ];

  @override
  Widget build(BuildContext context) {
    if (widget.day == "Friday")
      return eventList(fridayEventName, fridayEventLocation,
          fridayEventStartTime, fridayEventEndTime);

    if (widget.day == "Saturday")
      return eventList(saturdayEventName, saturdayEventLocation,
          saturdayEventStartTime, saturdayEventEndTime);
    else {
      return eventList(sundayEventName, sundayEventLocation,
          sundayEventStartTime, sundayEventEndTime);
    }
  }

  Widget eventList(List event, List location, List start, List end) {
    // print(event['1']['endTime']);
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
                  event[index],
                  style: TextStyle(
                    fontSize: 13.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.location_on,
                  color: Colors.green,
                ),
                title: Text(
                  'Location',
                  style: TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  location[index],
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
                  '${start[index]} - ${end[index]}',
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
