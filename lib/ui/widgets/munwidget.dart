import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mun/utils/constants.dart';

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
            'KIIT e-MUN\n\nDecember 17 - December 19\n\n$tagLine',
            textAlign: TextAlign.center,
            style: GoogleFonts.montserrat(
              color: Colors.green[300],
            ),
          ),
        ],
      ),
    );
  }
}
