import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 40.0,
            vertical: 10.0,
          ),
          child: Text(
            'Secretariat',
            style: GoogleFonts.montserrat(
              fontSize: size.width * 0.05,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: StreamBuilder(
              stream:
                  FirebaseFirestore.instance.collection("members").snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasData) {
                  Map members = snapshot.data.docs[0].data();
                  return contactList(members, size);
                } else {
                  return Center(
                    child: Text('Error fetching details'),
                  );
                }
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget contactList(Map members, Size size) {
    return ListView.builder(
      itemCount: members.length,
      itemBuilder: (context, index) {
        return Container(
          padding: EdgeInsets.all(5.0),
          margin: EdgeInsets.all(20.0),
          child: Row(
            children: [
              CircleAvatar(
                radius: 35.0,
                backgroundImage: CachedNetworkImageProvider(
                    members.values.elementAt(index)['imageUrl']),
              ),
              SizedBox(width: 30.0),
              RichText(
                text: TextSpan(
                  text: members.values.elementAt(index)['name'] + '\n',
                  style: DefaultTextStyle.of(context).style.copyWith(
                        fontSize: size.width * 0.035,
                      ),
                  children: <TextSpan>[
                    TextSpan(
                      text: members.values.elementAt(index)['designation'],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: size.width * 0.028,
                        color: Colors.red[300],
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              FloatingActionButton(
                backgroundColor: Colors.transparent,
                foregroundColor: Colors.green,
                heroTag: members.values.elementAt(index)['name'],
                child: Icon(
                  Icons.call,
                  size: size.width * 0.06,
                ),
                mini: true,
                onPressed: () async {
                  String url =
                      'tel:${members.values.elementAt(index)['phone']}';
                  if (await canLaunch(url)) {
                    await launch(url);
                  } else {
                    throw 'Could not launch $url';
                  }
                },
              )
            ],
          ),
        );
      },
    );
  }
}
