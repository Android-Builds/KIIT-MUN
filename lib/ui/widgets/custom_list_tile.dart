import 'package:flutter/material.dart';
import 'package:mun/utils/constants.dart';
import 'package:mun/utils/themes.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    Key? key,
    required this.icon,
    required this.title,
    required this.text,
  }) : super(key: key);
  final IconData icon;
  final String title;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          dense: true,
          leading: Icon(
            icon,
            color: Color(0xFFd4af37),
          ),
          title: Text(
            title,
            style: TextStyle(
              fontSize: size.width * 0.05,
              fontWeight: FontWeight.bold,
              color: accentColor,
            ),
          ),
          onTap: () => Navigator.of(context).pop(),
        ),
        ListTile(
          dense: true,
          leading: SizedBox(width: size.width * 0.1),
          title: Text(
            text + "\n",
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: size.width * 0.03,
            ),
          ),
        ),
      ],
    );
  }
}
