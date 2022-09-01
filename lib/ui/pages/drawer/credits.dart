import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mun/utils/functions.dart';
import 'package:url_launcher/url_launcher.dart';

final textStyle = GoogleFonts.montserrat(
  fontSize: 16.0,
  fontWeight: FontWeight.bold,
);

final textStyle2 = GoogleFonts.montserrat(
  fontSize: 12.0,
  fontWeight: FontWeight.bold,
);

class Credits extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Credits',
          style: GoogleFonts.montserrat(
            fontSize: size.width * 0.04,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: buildCredits(context, size),
    );
  }

  Widget buildCredits(BuildContext context, Size size) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        SizedBox(height: 10),
        Text(
          'An app by KIIT MUN Society',
          style: textStyle,
          textAlign: TextAlign.center,
        ),
        Column(
          children: <Widget>[
            Text(
              'Developed by: \n\n Web and App Team',
              style: textStyle,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  icon: Icon(FontAwesomeIcons.linkedin),
                  onPressed: () {
                    launch('');
                  },
                ),
                SizedBox(
                  width: 20,
                ),
                IconButton(
                  icon: Icon(FontAwesomeIcons.mailBulk),
                  onPressed: () async {
                    final Uri _emailLaunchUri = Uri(
                      scheme: 'mailto',
                      path: '',
                      queryParameters: {'subject': 'Problem in KIIT MUN app!'},
                    );
                    var url = _emailLaunchUri.toString();
                    if (await canLaunch(url))
                      await launch(url);
                    else
                      launchError(context);
                  },
                ),
              ],
            )
          ],
        ),
        SizedBox(
          height: 30,
        ),
        Text(
          'App Version : 2.2.0\n\u00a9 KIIT MUN',
          style: textStyle2,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
