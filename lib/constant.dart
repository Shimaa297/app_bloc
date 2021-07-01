import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


const defaultColor = Colors.cyan;

ThemeData themeDataLight = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  primarySwatch: defaultColor,
  appBarTheme: AppBarTheme(
      backwardsCompatibility: false,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
      ),
      backgroundColor: Colors.white,
      elevation: 0.0,
      iconTheme: IconThemeData(
        color: Colors.black,
        size: 25.0,
      ),
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 30,
      )
  ),
  textTheme: TextTheme(
    bodyText1: TextStyle(
      color: Colors.black,
      fontSize: 20,
      fontWeight: FontWeight.w600,
    ),
      subtitle1: TextStyle(
        color: Colors.black54,
        fontSize: 16,
      )
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    backgroundColor: Colors.white,
    selectedItemColor: defaultColor,
    unselectedItemColor: Colors.grey,
    elevation: 0.0,
  )
);

ThemeData themeDataDark = ThemeData(
    scaffoldBackgroundColor: Colors.grey[900],
    primarySwatch: defaultColor,
    appBarTheme: AppBarTheme(
      backwardsCompatibility: false,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.grey[900],
        statusBarIconBrightness: Brightness.light,
      ),
      backgroundColor: Colors.grey[900],
      elevation: 0.0,
      iconTheme: IconThemeData(
        color: Colors.white,
        size: 25.0,
      ),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 30,
      ),
  ),
    textTheme: TextTheme(
      bodyText1: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
      subtitle1: TextStyle(
        color: Colors.white,
        fontSize: 16,
      )
  ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      elevation: 0.0,
      backgroundColor:  Colors.grey[900],
      selectedItemColor: defaultColor,
      unselectedItemColor: Colors.grey,
    )

);

String token = '';