import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final Color accentColor = Colors.red.shade300;

ThemeData lightTheme = ThemeData.light().copyWith(
  textTheme: GoogleFonts.montserratTextTheme(
    ThemeData.light().textTheme,
  ),
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
  textTheme: GoogleFonts.montserratTextTheme(
    ThemeData.dark().textTheme,
  ),
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

IconThemeData iconTheme = IconThemeData(color: accentColor);
