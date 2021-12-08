import 'package:flutter/material.dart';
import 'package:mun/ui/widgets/list_poster.dart';
import 'package:mun/utils/constants.dart';

class Gallery extends StatefulWidget {
  const Gallery({Key? key}) : super(key: key);

  @override
  _GalleryState createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Gallery',
          style: TextStyle(
            fontSize: size.width * 0.04,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      // body: Padding(
      //   padding: const EdgeInsets.all(20.0),
      //   child: CarouselSlider(
      //     options: CarouselOptions(
      //       height: size.height,
      //       pauseAutoPlayOnTouch: false,
      //       //aspectRatio: 16 / 9,
      //       viewportFraction: 0.45,
      //       initialPage: 0,
      //       enableInfiniteScroll: true,
      //       reverse: false,
      //       autoPlay: false,
      //       autoPlayInterval: Duration(seconds: 5),
      //       autoPlayAnimationDuration: Duration(milliseconds: 2000),
      //       autoPlayCurve: Curves.fastOutSlowIn,
      //       scrollDirection: Axis.vertical,
      //     ),
      //     items: images.map((i) {
      //       return Builder(
      //         builder: (BuildContext context) {
      //           return Container(
      //             width: MediaQuery.of(context).size.width,
      //             child: ClipRRect(
      //               borderRadius: BorderRadius.circular(10.0),
      //               child: CachedNetworkImage(
      //                 imageUrl: 'https://kiitmun.org$i',
      //                 //fit: BoxFit.cover,
      //                 progressIndicatorBuilder: (context, url, progress) =>
      //                     Center(
      //                   child: CircularProgressIndicator(),
      //                 ),
      //               ),
      //             ),
      //           );
      //         },
      //       );
      //     }).toList(),
      //   ),
      // ),
      body: ListView.builder(
        itemCount: galleryList.length,
        physics: BouncingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return ListPoster(
            imageUrl: 'https://kiitmun.org${galleryList[index]}',
          );
        },
      ),
    );
  }
}
