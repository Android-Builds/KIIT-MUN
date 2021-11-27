import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final Color accentColor = Colors.red.shade300;

ThemeData lightTheme = ThemeData.light().copyWith(
  textTheme: lightTextTheme,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarTheme(
    elevation: 0.0,
    color: Colors.white,
    iconTheme: iconTheme,
    titleTextStyle: TextStyle(color: Colors.black),
  ),
  tabBarTheme: TabBarTheme(
    labelStyle: fontStyle.copyWith(color: Colors.black),
    labelColor: accentColor,
    unselectedLabelColor: Colors.black,
    indicator: UnderlineTabIndicator(
      borderSide: BorderSide(
        color: accentColor,
        width: 2.0,
      ),
    ),
  ),
  colorScheme: ColorScheme.fromSwatch().copyWith(secondary: accentColor),
);

ThemeData darkTheme = ThemeData.dark().copyWith(
  cardColor: Colors.grey[900],
  visualDensity: VisualDensity.adaptivePlatformDensity,
  canvasColor: Colors.black,
  textTheme: textTheme,
  scaffoldBackgroundColor: Colors.black,
  bottomSheetTheme: BottomSheetThemeData(
    backgroundColor: Colors.grey[900],
  ),
  appBarTheme: AppBarTheme(
    elevation: 0.0,
    color: Colors.black,
    iconTheme: iconTheme,
  ),
  tabBarTheme: TabBarTheme(
    labelStyle: fontStyle,
    labelColor: accentColor,
    unselectedLabelColor: Colors.white,
    indicator: UnderlineTabIndicator(
      borderSide: BorderSide(
        color: accentColor,
        width: 2.0,
      ),
    ),
  ),
  popupMenuTheme: PopupMenuThemeData(color: Colors.black),
  dialogBackgroundColor: Colors.black,
  snackBarTheme: SnackBarThemeData(
    backgroundColor: Colors.grey[900],
    actionTextColor: accentColor,
    contentTextStyle: TextStyle(
      color: Colors.white,
    ),
  ),
  colorScheme: ColorScheme.fromSwatch().copyWith(secondary: accentColor),
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

IconThemeData iconTheme = IconThemeData(color: accentColor);
