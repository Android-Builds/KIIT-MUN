import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mun/utils/constants.dart';

class Carousel extends StatelessWidget {
  const Carousel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      child: CarouselSlider(
        options: CarouselOptions(
          height: size.width * 0.9,
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
                child: CachedNetworkImage(
                  imageUrl: 'https://kiitmun.org$i',
                  fit: BoxFit.cover,
                  progressIndicatorBuilder: (context, url, progress) => Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              );
            },
          );
        }).toList(),
      ),
    );
  }
}
