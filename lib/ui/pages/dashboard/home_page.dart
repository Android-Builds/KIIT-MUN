import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mun/ui/widgets/customFlipPanel.dart';
import 'package:mun/ui/widgets/media_buttons.dart';
import 'package:mun/utils/constants.dart';
import 'package:url_launcher/url_launcher.dart';

import '../announce.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Size size;
  bool darkmode;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    darkmode = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          AbsorbPointer(child: carouselWidget(context, size)),
          Spacer(),
          !done ? timerWidgets() : buildAnnounce(context, size),
        ],
      ),
    );
  }

  Widget buildAnnounce(BuildContext context, Size size) {
    return Column(
      children: [
        FlatButton(
          padding: EdgeInsets.zero,
          child: Stack(
            children: <Widget>[
              Container(
                height: size.height * 0.16,
                width: size.width * 0.87,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.speaker_phone,
                      color: darkmode
                          ? Colors.white.withOpacity(0.4)
                          : Colors.black.withOpacity(0.4),
                      size: size.width * 0.12,
                    ),
                    Text(
                      'Live Feed',
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.bold,
                        color: darkmode
                            ? Colors.white.withOpacity(0.3)
                            : Colors.black.withOpacity(0.3),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: size.height * 0.16,
                width: size.width * 0.87,
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: darkmode
                      ? Colors.white.withOpacity(0.15)
                      : Colors.black.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ],
          ),
          onPressed: () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => Announce())),
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
              icon: FontAwesomeIcons.chrome,
              url: 'https://kiitmun.org/',
            ),
          ],
        )
      ],
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
            color: Colors.green[300],
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 50.0),
        FlipClock(
          onDone: () {
            done = true;
            setState(() {});
          },
          duration: Duration(
            days: days,
            hours: hours,
            minutes: minutes,
            seconds: seconds,
          ),
          spacing: EdgeInsets.symmetric(
            vertical: 5.0,
            horizontal: 2.0,
          ),
          borderRadius: BorderRadius.circular(2.0),
          digitColor: darkmode ? Colors.black : Colors.white,
          backgroundColor: darkmode ? Colors.white : Colors.black,
          digitSize: size.width * 0.05,
        ),
        SizedBox(height: 50.0),
        MaterialButton(
            minWidth: size.width * 0.35,
            height: size.width * 0.11,
            color: Colors.green[300],
            child: Text(
              'Register Now',
              style: GoogleFonts.montserrat(
                fontSize: size.width * 0.037,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: () async {
              String url = 'https://kiitmun.org/registration.php';
              if (await canLaunch(url)) {
                launch(url);
              }
            }),
      ],
    );
  }

  Widget buildCarousel(width) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      child: CarouselSlider(
        options: CarouselOptions(
          height: width * 0.9,
          pauseAutoPlayOnTouch: false,
          aspectRatio: 16 / 9,
          viewportFraction: 1,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 5),
          autoPlayAnimationDuration: Duration(milliseconds: 2000),
          autoPlayCurve: Curves.fastOutSlowIn,
          scrollDirection: Axis.horizontal,
        ),
        items: images.map((i) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: CachedNetworkImageProvider(i),
                  ),
                ),
              );
            },
          );
        }).toList(),
      ),
    );
  }

  Widget munWidget() {
    return Container(
      height: size.width * 0.9,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: size.width * 0.5,
            width: size.width * 0.5,
            child: Image.asset('$munLogo'),
          ),
          Text(
            'KIIT e-MUN\n\nJanuray 29 - January 31\n\n#VoicesAgainstVices',
            textAlign: TextAlign.center,
            style: GoogleFonts.montserrat(
              color: Colors.green[300],
            ),
          ),
        ],
      ),
    );
  }

  Widget overlayCarousel() {
    List<Widget> overlay = [
      Container(),
      Container(
        height: size.width * 0.9,
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.7),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: munWidget(),
      ),
    ];

    return CarouselSlider.builder(
      options: CarouselOptions(
        pauseAutoPlayOnTouch: false,
        aspectRatio: 16 / 9,
        viewportFraction: 1,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 8),
        autoPlayAnimationDuration: Duration(milliseconds: 2000),
        autoPlayCurve: Curves.fastOutSlowIn,
        scrollDirection: Axis.vertical,
      ),
      itemCount: overlay.length,
      itemBuilder: (BuildContext context, int itemIndex) => Container(
        child: overlay[itemIndex],
      ),
    );
  }

  Widget carouselWidget(BuildContext context, Size size) {
    return Stack(
      children: <Widget>[
        Container(
          child: buildCarousel(size.width),
        ),
        Center(
          child: Container(
            height: size.width * 0.9,
            child: overlayCarousel(),
          ),
        ),
      ],
    );
  }
}
