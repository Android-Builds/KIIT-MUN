import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mun/ui/widgets/Loader.dart';
import 'package:mun/utils/constants.dart';
import 'package:url_launcher/url_launcher.dart';

List<String> names = [
  "SAGNIK GHOSH",
  "MANAS MISHRA",
  "RHEA SINHA",
  "SURARCHI KUMAR",
  "OM CHAITANYA"
];

List<String> phoneNumber = [
  "8144021921",
  "6394324923",
  "8557912643",
  "8260010846",
  "9955818809"
];

// List<String> images = [
//   "https://kiitmun.org/assets/img/members/sagnik-ghosh.png",
//   "https://kiitmun.org/assets/img/members/manas-mishra.png",
//   "https://kiitmun.org/assets/img/members/rhea-sinha.png",
//   "https://kiitmun.org/assets/img/members/surarchi-kumar.png",
//   "https://kiitmun.org/assets/img/members/om-chaitanya.png",
// ];

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
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Loader();
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
        physics: BouncingScrollPhysics(),
        itemCount: 5,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.all(5.0),
            margin: EdgeInsets.all(20.0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 35.5,
                  backgroundColor: darkMode ? Colors.white : Colors.black,
                  child: CircleAvatar(
                    radius: 35.0,
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                    backgroundImage: NetworkImage(
                      imagesOfTop5[index],
                    ),
                  ),
                ),
                SizedBox(width: 30.0),
                RichText(
                  text: TextSpan(
                    text: names[index] + '\n',
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
                IconButton(
                  color: Colors.green,
                  icon: Icon(
                    Icons.call,
                    size: size.width * 0.06,
                  ),
                  onPressed: () async {
                    String url = 'tel:+91${phoneNumber[index]}';
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
        });
  }
}
