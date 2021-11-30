import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:mun/ui/widgets/Loader.dart';
import 'package:mun/ui/widgets/connectInternet.dart';
import 'package:mun/ui/widgets/custom_listtile.dart';
import 'package:mun/ui/widgets/list_poster.dart';
import 'package:mun/utils/constants.dart';
import 'package:mun/utils/themes.dart';

class CommittePage extends StatefulWidget {
  @override
  _CommittePageState createState() => _CommittePageState();
}

class _CommittePageState extends State<CommittePage> {
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
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting)
                  return Loader();
                else if (snapshot.hasData) {
                  Map doc = snapshot.data.docs[0].data();
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
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.all(10.0),
      itemCount: map.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            onTap: () => _showDescription(
                context,
                map.keys.elementAt(index),
                map.values.elementAt(index)['fullForm'],
                map.values.elementAt(index)['about'],
                map.values.elementAt(index)['agenda'],
                map.values.elementAt(index)['poster'],
                map.values.elementAt(index)['agendaPoster'],
                map.values.elementAt(index)['ebPoster'],
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
                color: accentColor,
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
                    infoTexts(
                      'Level: ',
                      map.values.elementAt(index)['level'],
                    ),
                    Spacer(),
                    infoTexts(
                      'Delegate: ',
                      map.values.elementAt(index)['delegate'],
                    )
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget infoTexts(String title, String text) => RichText(
        text: TextSpan(
          //text: title,
          style: Theme.of(context)
              .textTheme
              .bodyText1!
              .copyWith(fontSize: size.width * 0.03),
          children: <TextSpan>[
            TextSpan(
              text: title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: accentColor,
              ),
            ),
            TextSpan(text: text),
          ],
        ),
      );

  void _showDescription(
    context,
    String? committee,
    String? fullForm,
    String? description,
    String? agenda,
    String? committeePoster,
    String? agendaPoster,
    String? ebPoster,
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
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: <Widget>[
              SizedBox(height: 10.0),
              CustomListTile(
                icon: FontAwesomeIcons.globe,
                title: committee!,
                text: fullForm!,
              ),
              ListPoster(imageUrl: committeePoster!),
              SizedBox(height: 10.0),
              display
                  ? CustomListTile(
                      icon: Icons.star,
                      title: 'Agenda',
                      text: agenda!,
                    )
                  : SizedBox.shrink(),
              ListPoster(imageUrl: agendaPoster!),
              SizedBox(height: 10.0),
              CustomListTile(
                icon: Icons.book,
                title: 'About',
                text: description!,
              ),
              SizedBox(height: 10),
              ListTile(
                leading: Icon(
                  FontAwesomeIcons.book,
                  color: Color(0xFFd4af37),
                ),
                title: Text(
                  "Executive Board",
                  style: TextStyle(
                    fontSize: size.width * 0.05,
                    fontWeight: FontWeight.bold,
                    color: accentColor,
                  ),
                ),
                onTap: () => Navigator.of(context).pop(),
              ),
              ListPoster(imageUrl: ebPoster!),
            ],
          ),
        );
      },
    );
  }
}
