import 'package:flutter/material.dart';
import 'package:mun/utils/themes.dart';
import 'package:url_launcher/url_launcher.dart';

class MediaButtons extends StatelessWidget {
  final IconData icon;
  final String url;

  const MediaButtons({
    Key? key,
    required this.icon,
    required this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final bool darkmode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    return InkWell(
      onTap: () async {
        if (await canLaunch(url)) launch(url);
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: size.width * 0.1,
            height: size.width * 0.1,
            child: Icon(
              icon,
              size: size.width * 0.07,
              color: darkmode
                  ? Colors.white.withOpacity(0.4)
                  : Colors.black.withOpacity(0.4),
            ),
          ),
          Container(
            width: size.width * 0.15,
            height: size.width * 0.15,
            decoration: BoxDecoration(
              color: darkmode
                  ? Colors.white.withOpacity(0.15)
                  : Colors.black.withOpacity(0.15),
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
        ],
      ),
    );
  }
}

class MiniMediaButtons extends StatelessWidget {
  final IconData? icon;
  final String? url;

  const MiniMediaButtons({
    Key? key,
    this.icon,
    this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return IconButton(
      icon: Icon(
        icon,
        size: size.width * 0.07,
        color: accentColor.withOpacity(0.7),
      ),
      onPressed: () async {
        if (await canLaunch(url!)) launch(url!);
      },
    );
  }
}
