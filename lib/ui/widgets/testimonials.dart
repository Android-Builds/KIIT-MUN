import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mun/ui/widgets/Loader.dart';
import 'package:mun/utils/constants.dart';
import 'package:mun/utils/themes.dart';

class Testimonials extends StatelessWidget {
  Testimonials({Key? key}) : super(key: key);

  List<String> names = [
    "SAGNIK GHOSH",
    "MANAS MISHRA",
    "RHEA SINHA",
    "SURARCHI KUMAR",
    "OM CHAITANYA"
  ];

  List<String> designation = [
    "Secretary General",
    "Deputy Secretary General",
    "Director General",
    "Deputy Director General",
    "Chargé D'affaires"
  ];

  Future<void> _showMyDialog(
    BuildContext context,
    String name,
    String text,
    String desg,
  ) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.red.shade300,
                ),
              ),
              SizedBox(height: 5.0),
              Text(
                desg,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: size.width * 0.03,
                ),
              ),
            ],
          ),
          content: Text(text),
          actions: <Widget>[
            TextButton(
              child: const Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  final ScrollController scrollController =
      ScrollController(initialScrollOffset: 50.0);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection("members").snapshots(),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Loader();
        } else if (snapshot.hasData) {
          Map members = snapshot.data.docs[0].data();
          return SizedBox(
            height: size.height * 0.28,
            child: Scrollbar(
              thumbVisibility: true,
              showTrackOnHover: true,
              controller: scrollController,
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: members.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () => _showMyDialog(
                      context,
                      names[index],
                      testimonials[index],
                      members.values.elementAt(index)['designation'],
                    ),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 5.0,
                        vertical: 10.0,
                      ),
                      height: size.height * 0.3,
                      width: size.width * 0.45,
                      child: Card(
                        elevation: 8.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                radius: 42.5,
                                backgroundColor:
                                    darkMode ? Colors.white : Colors.black,
                                child: CircleAvatar(
                                  radius: 42.0,
                                  backgroundColor:
                                      Theme.of(context).scaffoldBackgroundColor,
                                  backgroundImage: CachedNetworkImageProvider(
                                    imagesOfTop5[index],
                                  ),
                                ),
                              ),
                              SizedBox(height: 20.0),
                              RichText(
                                textAlign: TextAlign.center,
                                maxLines: 2,
                                text: TextSpan(
                                  text: names[index] + '\n',
                                  style: DefaultTextStyle.of(context)
                                      .style
                                      .copyWith(
                                        fontSize: size.width * 0.035,
                                        fontWeight: FontWeight.bold,
                                      ),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: designation[index],
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: size.width * 0.025,
                                        color: accentColor,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        } else {
          return Center(
            child: Text('Error fetching details'),
          );
        }
      },
    );
  }
}
