import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mun/ui/widgets/media_buttons.dart';
import 'package:mun/utils/constants.dart';
import 'package:mun/utils/themes.dart';

class AnnounceWidget extends StatelessWidget {
  const AnnounceWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MediaButtons(
                  icon: FontAwesomeIcons.facebookF,
                  url: 'https://www.facebook.com/kiitmun',
                ),
                MediaButtons(
                  icon: FontAwesomeIcons.instagram,
                  url: 'https://www.instagram.com/instakiitmun/',
                ),
                MediaButtons(
                  icon: FontAwesomeIcons.twitter,
                  url: 'https://twitter.com/kiitmun?s=08',
                ),
                MediaButtons(
                  icon: FontAwesomeIcons.linkedinIn,
                  url: 'https://www.linkedin.com/in/kiitmun',
                ),
                MediaButtons(
                  icon: FontAwesomeIcons.globe,
                  url: 'https://kiitmun.org/',
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
