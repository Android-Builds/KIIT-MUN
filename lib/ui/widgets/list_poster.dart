import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mun/utils/constants.dart';
import 'package:shimmer/shimmer.dart';

class ListPoster extends StatelessWidget {
  const ListPoster({Key? key, required this.imageUrl}) : super(key: key);
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 20.0,
      ),
      child: imageUrl != ''
          ? ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                height: size.height * 0.3,
                width: size.width,
                fit: BoxFit.fill,
                placeholder: (context, url) => Shimmer.fromColors(
                  baseColor: Colors.grey,
                  highlightColor: Theme.of(context).scaffoldBackgroundColor,
                  child: Container(
                    height: size.height * 0.3,
                    width: size.width,
                    color: Colors.grey,
                  ),
                ),
              ),
            )
          : LottieBuilder.asset('assets/coming_soon.json'),
    );
  }
}
