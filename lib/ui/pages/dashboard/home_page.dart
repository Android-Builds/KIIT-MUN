import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mun/ui/widgets/customFlipPanel.dart';
import 'package:mun/utils/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Size size;
  bool done = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    bool darkmode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AbsorbPointer(child: carouselWidget(context, size)),
          !done
              ? FlipClock(
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
                )
              : FlatButton(
                  onPressed: () {},
                  child: Text('Live Feed'),
                ),
          !done
              ? MaterialButton(
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
                  })
              : SizedBox.shrink(),
        ],
      ),
    );
  }

  Widget buildCarousel(width) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
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
      // munWidget(),
      Container(
        height: size.width * 0.9,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Opacity(
            opacity: 0.8,
            child: Container(
              alignment: Alignment.center,
              child: munWidget(),
              color: Colors.black,
            ),
          ),
        ),
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
    return Container(
      child: Stack(
        children: <Widget>[
          Container(
            child: buildCarousel(size.width),
          ),
          // Container(
          //   height: size.width * 0.8,
          //   child: ClipRRect(
          //     borderRadius: BorderRadius.circular(10),
          //     child: Opacity(
          //       opacity: 0.8,
          //       child: Container(
          //         color: Colors.black,
          //       ),
          //     ),
          //   ),
          // ),
          Center(
            child: Container(
              height: size.width * 0.9,
              child: overlayCarousel(),
            ),
          ),
        ],
      ),
    );
  }
}
