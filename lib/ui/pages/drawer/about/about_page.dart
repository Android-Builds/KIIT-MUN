import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mun/utils/constants.dart';

class AboutPage extends StatelessWidget {
  final int index;

  const AboutPage({Key key, @required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          abouts[index].name,
          style: TextStyle(
            fontSize: size.width * 0.04,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            Row(
              children: <Widget>[
                Icon(
                  Icons.book,
                  color: Colors.green[300],
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'About',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.green[300],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Flexible(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: <Widget>[
                    abouts[index].imageUrl != ''
                        ? Container(
                            color: Colors.white,
                            child: CachedNetworkImage(
                              imageUrl: abouts[index].imageUrl,
                              placeholder: (context, url) => Center(
                                child: CircularProgressIndicator(),
                              ),
                            ),
                          )
                        : SizedBox.shrink(),
                    SizedBox(height: 30),
                    Text(
                      abouts[index].description,
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 14.0,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
