import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightTheme = ThemeData.light().copyWith(
  accentColor: Colors.green[300],
  textTheme: lightTextTheme,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarTheme(
    elevation: 0.0,
    color: Colors.white,
    iconTheme: iconTheme,
    textTheme: lightTextTheme,
  ),
  tabBarTheme: TabBarTheme(
    labelStyle: fontStyle.copyWith(color: Colors.black),
    labelColor: Colors.green[300],
    unselectedLabelColor: Colors.black,
    indicator: UnderlineTabIndicator(
      borderSide: BorderSide(
        color: Colors.green[300],
        width: 2.0,
      ),
    ),
  ),
);

ThemeData darkTheme = ThemeData.dark().copyWith(
  cardColor: Colors.grey[900],
  accentColor: Colors.green[300],
  visualDensity: VisualDensity.adaptivePlatformDensity,
  canvasColor: Colors.black,
  textTheme: textTheme,
  scaffoldBackgroundColor: Colors.black,
  bottomSheetTheme: BottomSheetThemeData(
    backgroundColor: Colors.grey[900],
  ),
  appBarTheme: AppBarTheme(
    color: Colors.black,
    textTheme: textTheme,
    iconTheme: iconTheme,
  ),
  tabBarTheme: TabBarTheme(
    labelStyle: fontStyle,
    labelColor: Colors.green[300],
    unselectedLabelColor: Colors.white,
    indicator: UnderlineTabIndicator(
      borderSide: BorderSide(
        color: Colors.green[300],
        width: 2.0,
      ),
    ),
  ),
  popupMenuTheme: PopupMenuThemeData(color: Colors.black),
  dialogBackgroundColor: Colors.black,
  snackBarTheme: SnackBarThemeData(
    backgroundColor: Colors.grey[900],
    actionTextColor: Colors.green[300],
    contentTextStyle: TextStyle(
      color: Colors.white,
    ),
  ),
);

TextStyle fontStyle = GoogleFonts.montserrat();

TextTheme textTheme = TextTheme(
  headline1: fontStyle,
  headline2: fontStyle,
  headline3: fontStyle,
  headline4: fontStyle,
  headline5: fontStyle,
  headline6: fontStyle,
  bodyText1: fontStyle,
  bodyText2: fontStyle,
  subtitle1: fontStyle,
  subtitle2: fontStyle,
);

TextTheme lightTextTheme = TextTheme(
  headline1: fontStyle.copyWith(color: Colors.black),
  headline2: fontStyle.copyWith(color: Colors.black),
  headline3: fontStyle.copyWith(color: Colors.black),
  headline4: fontStyle.copyWith(color: Colors.black),
  headline5: fontStyle.copyWith(color: Colors.black),
  headline6: fontStyle.copyWith(color: Colors.black),
  bodyText1: fontStyle.copyWith(color: Colors.black),
  bodyText2: fontStyle.copyWith(color: Colors.black),
  subtitle1: fontStyle.copyWith(color: Colors.black),
  subtitle2: fontStyle.copyWith(color: Colors.black),
);

IconThemeData iconTheme = IconThemeData(color: Colors.green[300]);
