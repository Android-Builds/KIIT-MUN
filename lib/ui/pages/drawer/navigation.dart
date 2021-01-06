import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mun/ui/widgets/updated.dart';
import 'package:mun/utils/functions.dart';
import 'dart:async';
import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';
import '../../widgets/connectInternet.dart';
import 'package:connectivity/connectivity.dart';

var loading = false;
var isUpdated;
var isOffline = false;

class Navigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          child: Icon(
            Icons.arrow_back,
            color: Colors.red[300],
          ),
          onTap: () => Navigator.pop(context),
        ),
        elevation: 1.0,
        title: Text(
          'Navigation',
          style: TextStyle(
            fontSize: size.width * 0.045,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: LoadNav(),
    );
  }
}

class LoadNav extends StatefulWidget {
  @override
  _LoadNavState createState() => _LoadNavState();
}

class _LoadNavState extends State<LoadNav> {
  Connectivity connectivity;

  Future<Map> getData() async {
    var url = "https://kiit-mun.firebaseio.com/locations.json";
    final response = await http.get(url);
    return json.decode(response.body);
  }

  @override
  void initState() {
    connectivity = new Connectivity();
    connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
      if (result == ConnectivityResult.wifi ||
          result == ConnectivityResult.mobile)
        isOffline = false;
      else
        isOffline = true;
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return isOffline
        ? Connect()
        : FutureBuilder(
            future: getData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting)
                return Center(
                  child: CircularProgressIndicator(),
                );
              else if (snapshot.hasData) {
                return snapshot.data['isUpdated'] == 0
                    ? Updated()
                    : navigationList(snapshot.data['Locations']);
              } else
                return Connect();
            },
          );
  }

  Widget navigationList(List feedList) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.all(10.0),
      itemCount: feedList.length,
      itemBuilder: (context, index) {
        final feedListItem = feedList[index];
        return Card(
          color: Colors.transparent,
          child: ExpansionTile(
            title: Text(
              feedListItem['id'],
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            children: <Widget>[
              ListTile(
                leading: Icon(
                  Icons.event_available,
                  color: Colors.red[300],
                ),
                title: Text(
                  feedListItem['name'],
                  style: TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.map,
                  color: Colors.red[300],
                ),
                title: Text(
                  feedListItem['venue'],
                  style: TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                height: 80,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Column(
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.navigation,
                              color: Colors.red[300],
                            ),
                            onPressed: () {},
                          ),
                          Text(
                            'Navigate to Venue',
                            style: TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.call,
                              color: Colors.red[300],
                            ),
                            onPressed: () {},
                          ),
                          Text(
                            'For Help, Call ' + feedListItem['personName'],
                            style: TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  navigate(lat, lon) async {
    var url = 'google.navigation:q=$lat,$lon';
    if (await canLaunch(url))
      launch(url);
    else
      launchError(context);
  }

  call(phone) {
    var url = 'tel:$phone';
    launch(url);
  }
}
