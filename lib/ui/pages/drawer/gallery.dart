import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
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
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: galleryList.length,
        itemBuilder: (BuildContext context, int index) {
          return CachedNetworkImage(
            height: 200.0,
            width: 200.0,
            imageUrl: 'https://kiitmun.org/${galleryList[index]}',
          );
        },
      ),
    );
  }
}
