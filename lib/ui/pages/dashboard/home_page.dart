import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mun/ui/widgets/announcewidget.dart';
import 'package:mun/ui/widgets/carousel.dart';
import 'package:mun/ui/widgets/customFlipPanel.dart';
import 'package:mun/ui/widgets/media_buttons.dart';
import 'package:mun/ui/widgets/munwidget.dart';
import 'package:mun/ui/widgets/overlaycarousel.dart';
import 'package:mun/ui/widgets/testimonials.dart';
import 'package:mun/utils/constants.dart';
import 'package:mun/utils/themes.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Size size;
  late bool darkmode;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    darkmode = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          AbsorbPointer(child: carouselWidget(context, size)),
          SizedBox(height: 20.0),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 30.0,
              vertical: 20.0,
            ),
            child: Divider(thickness: 2.0),
          ),
          !done ? timerWidgets() : AnnounceWidget(),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 30.0,
              vertical: 20.0,
            ),
            child: Divider(thickness: 2.0),
          ),
          ListTile(
            dense: true,
            title: Text(
              'Testimonials:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: size.width * 0.05,
              ),
            ),
          ),
          Testimonials(),
          Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: Row(
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
            ),
          )
        ],
      ),
    );
  }

  Widget timerWidgets() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          'Event Live in: ',
          style: TextStyle(
            fontSize: size.width * 0.06,
            color: accentColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 40.0),
        FlipClock(
          onDone: () {
            done = true;
            setState(() {});
          },
          duration: eventDate.difference(now),
          spacing: EdgeInsets.symmetric(
            vertical: 5.0,
            horizontal: 2.0,
          ),
          borderRadius: BorderRadius.circular(2.0),
          digitColor: darkmode ? Colors.black : Colors.white,
          backgroundColor: darkmode ? Colors.white : Colors.black,
          digitSize: size.width * 0.05,
        ),
        SizedBox(height: 30.0),
        Text(
          tagLine,
          style: TextStyle(
            fontSize: size.width * 0.04,
            color: accentColor,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }

  Widget carouselWidget(BuildContext context, Size size) {
    return Stack(
      children: <Widget>[
        Container(
          child: Carousel(),
        ),
        Center(
          child: Container(
            height: size.width * 0.9,
            child: Container(
              height: size.width * 0.9,
              width: size.width,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.7),
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: MunWidget(),
            ),
          ),
        ),
      ],
    );
  }
}
