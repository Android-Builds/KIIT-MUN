import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mun/ui/widgets/munwidget.dart';
import 'package:mun/utils/constants.dart';

class OverlayCarousel extends StatelessWidget {
  const OverlayCarousel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> overlay = [
      Container(),
      Container(
        height: size.width * 0.9,
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.7),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: MunWidget(),
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
      itemBuilder: (BuildContext context, int itemIndex, int a) => Container(
        child: overlay[itemIndex],
      ),
    );
  }
}
