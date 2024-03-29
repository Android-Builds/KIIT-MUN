import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mun/ui/pages/dashboard/contacts_page.dart';
import 'package:mun/ui/widgets/Loader.dart';
import 'package:mun/ui/widgets/connectInternet.dart';
import 'package:mun/ui/widgets/custom_list_tile.dart';
import 'package:mun/ui/widgets/list_poster.dart';
import 'package:mun/utils/constants.dart';
import 'package:mun/utils/themes.dart';
import 'package:url_launcher/url_launcher.dart';

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
                  return commiteeList(size);
                } else
                  return Center(child: Text('Error Fetching Data'));
              },
            ),
    );
  }

  Widget commiteeList(Size size) {
    return ListView.builder(
      controller: ScrollController(),
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.all(10.0),
      itemCount: committeeNames.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            onTap: () => _showDescription(
              context,
              committeeNames[index],
              fullForms[index],
              committeeImage[index],
              agenda[index],
              eb[index],
              maps[index],
              mapLocation[index],
              commiteeCordinator[index],
              commiteeCordinatorNumber[index],
              size,
            ),
            contentPadding: EdgeInsets.only(
              top: 10.0,
              bottom: 10.0,
              right: 15.0,
            ),
            leading: Container(
              decoration: BoxDecoration(),
              child: Image.asset(
                logo[index],
                fit: BoxFit.cover,
              ),
            ),
            title: Text(
              committeeNames[index] + '\n',
              style: TextStyle(
                color: accentColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  fullForms[index],
                  style: TextStyle(fontSize: size.width * 0.033),
                ),
                SizedBox(height: 20.0),
                Row(
                  children: [
                    infoTexts(
                      'Level: ',
                      level[index],
                    ),
                    Spacer(),
                    infoTexts(
                      'Delegate: ',
                      delegate[index],
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

    // String? description,
    // String? agenda,
    String? committeePoster,
    String? agendaPoster,
    String? ebPoster,
    String? mapUrl,
    String? venue,
    String? cordinator,
    String? phone,
    Size size,
  ) {
    bool display = false;

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
              ListPoster(
                imageUrl: committeePoster!,
              ),
              SizedBox(height: 10.0),
              committee != "IP"
                  ? CustomListTile(
                      icon: Icons.star,
                      title: 'Agenda',
                      text: "",
                    )
                  : SizedBox.shrink(),
              committee != "IP"
                  ? ListPoster(imageUrl: agendaPoster!)
                  : Container(),
              SizedBox(height: 10.0),
              // CustomListTile(
              //   icon: Icons.book,
              //   title: 'About',
              //   text: description!,
              // ),
              SizedBox(height: 10),
              committee != "UNSC"
                  ? ListTile(
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
                    )
                  : SizedBox.shrink(),
              committee != "UNSC"
                  ? ListPoster(imageUrl: ebPoster!)
                  : SizedBox.shrink(),
              ListTile(
                leading: Icon(
                  Icons.location_on,
                  color: Color(0xFFd4af37),
                ),
                title: Text(
                  "Venue",
                  style: TextStyle(
                    fontSize: size.width * 0.05,
                    fontWeight: FontWeight.bold,
                    color: accentColor,
                  ),
                ),
                // onTap: () => Navigator.of(context).pop(),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(70, 0, 70, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 10.0),
                      child: Text(venue!, style: TextStyle(fontSize: 15)),
                    ),
                    Container(
                      height: size.height * 0.06,
                      decoration: BoxDecoration(
                          color: accentColor,
                          borderRadius: BorderRadius.circular(10)),
                      child: InkWell(
                        onTap: () => {
                          launch(mapUrl!),
                        },
                        child: Center(
                          child: Text(
                            "Venue",
                            style: TextStyle(
                              fontSize: size.width * 0.048,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.support_agent,
                  color: Color(0xFFd4af37),
                ),
                title: Text(
                  "Committee Co-ordinator",
                  style: TextStyle(
                    fontSize: size.width * 0.05,
                    fontWeight: FontWeight.bold,
                    color: accentColor,
                  ),
                ),
                // onTap: () => Navigator.of(context).pop(),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(70, 0, 0, 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Icon(Icons.person, color: Colors.green[700]),
                    Text(cordinator!, style: TextStyle(fontSize: 15)),
                    Padding(
                      padding: EdgeInsets.only(left: size.width * 0.2),
                      child: IconButton(
                        icon: Icon(Icons.call, color: Colors.green[700]),
                        onPressed: () {
                          String url = 'tel:+91$phone';
                          launch(url);
                        },
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
