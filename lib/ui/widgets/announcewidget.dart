import 'package:flutter/material.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:mun/ui/widgets/media_buttons.dart';
import 'package:mun/utils/constants.dart';
import 'package:mun/utils/themes.dart';
import 'package:url_launcher/url_launcher.dart';

class AnnounceWidget extends StatefulWidget {
  const AnnounceWidget({Key? key}) : super(key: key);

  @override
  State<AnnounceWidget> createState() => _AnnounceWidgetState();
}

class _AnnounceWidgetState extends State<AnnounceWidget> {
  _launchURL(String url) async {
    await launchUrl(Uri.parse(url));
  }

  @override
  Widget build(BuildContext context) {
    // NotificationService notification = NotificationService();
    return Card(
      elevation: 8.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 20.0,
          horizontal: 10.0,
        ),
        child: Column(
          children: [
            Text(
              'Event Live Now',
              style: TextStyle(
                fontSize: size.width * 0.07,
                color: accentColor,
                fontWeight: FontWeight.w900,
              ),
            ),
            SizedBox(height: 30.0),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: InkWell(
                onTap: () {
                  _launchURL("https://kiitmun.org/registration.php");
                },
                child: Container(
                  height: size.height * 0.07,
                  // width: size.width,
                  decoration: BoxDecoration(
                    color: accentColor,
                    // border: Border.all(),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(MdiIcons.fileDocumentEditOutline,
                          color: Colors.white),
                      Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Center(
                          child: Text(
                            "Register Now",
                            style: GoogleFonts.montserrat(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //   children: [
            //     MediaButtons(
            //       icon: FontAwesomeIcons.facebookF,
            //       url: 'https://www.facebook.com/kiitmun',
            //     ),
            //     MediaButtons(
            //       icon: FontAwesomeIcons.instagram,
            //       url: 'https://www.instagram.com/instakiitmun/',
            //     ),
            //     MediaButtons(
            //       icon: FontAwesomeIcons.twitter,
            //       url: 'https://twitter.com/kiitmun?s=08',
            //     ),
            //     MediaButtons(
            //       icon: FontAwesomeIcons.linkedinIn,
            //       url: 'https://www.linkedin.com/in/kiitmun',
            //     ),
            //     MediaButtons(
            //       icon: FontAwesomeIcons.globe,
            //       url: 'https://kiitmun.org/',
            //     ),
            //   ],
            // )
          ],
        ),
      ),
    );
  }
}
