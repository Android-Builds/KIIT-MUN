import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mun/utils/constants.dart';

import '../../utils/themes.dart';

class MunWidget extends StatelessWidget {
  const MunWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            'KIIT International MUN 2022\n\nA Decade of Diplomacy \n#LiterateToLiberate\n\nSeptember 9 - September 11',
            textAlign: TextAlign.center,
            style: GoogleFonts.montserrat(
              fontWeight: FontWeight.w500,
              fontSize: 15,
              // color: Colors.green[300],
              color: accentColor,
            ),
          ),
        ],
      ),
    );
  }
}
