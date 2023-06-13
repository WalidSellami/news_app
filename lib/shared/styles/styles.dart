
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

ThemeData lightTheme = ThemeData(
  fontFamily: 'Ubuntu',
  scaffoldBackgroundColor: Colors.white,
  colorScheme: ColorScheme.light(
    brightness: Brightness.light,
    primary: HexColor('0571d5'),
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
    elevation: 0,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ),
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontSize: 20.0,
      fontFamily: 'Ubuntu',
    ),
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    elevation: 25.0,
    backgroundColor: Colors.white,
    selectedLabelStyle: TextStyle(
      fontSize: 15.0,
      fontWeight: FontWeight.bold,
    ),
    unselectedLabelStyle: TextStyle(
      fontSize: 14.0,
    ),
  ),
  navigationRailTheme: const NavigationRailThemeData(
    elevation: 15,
    backgroundColor: Colors.white,
    // indicatorColor: Colors.blue.shade100,
    // iconTheme: MaterialStatePropertyAll(
    //   IconThemeData(
    //     size: 26.0,
    //     color: HexColor('011d35'),
    //   ),
    // ),
  ),
  // floatingActionButtonTheme: FloatingActionButtonThemeData(
  //   backgroundColor: Colors.blue.shade700,
  // ),
  // textTheme: TextTheme(
  //   bodyText1: const TextStyle(
  //     color: Colors.black,
  //     fontSize: 20.0,
  //     height: 1.3,
  //     fontWeight: FontWeight.bold,
  //   ),
  //   bodyText2: TextStyle(
  //     color: Colors.grey.shade500,
  //   ),
  // ),
);

ThemeData darkTheme = ThemeData(
  primarySwatch: Colors.teal,
  fontFamily: 'Ubuntu',
  scaffoldBackgroundColor: HexColor('141414'),
  colorScheme: ColorScheme.dark(
    brightness: Brightness.dark,
    primary: HexColor('2eb7c9'),
  ),
  appBarTheme: AppBarTheme(
      backgroundColor:HexColor('141414'),
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: HexColor('141414'),
        statusBarIconBrightness: Brightness.light,
      ),
      titleTextStyle: const TextStyle(
        color: Colors.white,
        fontSize: 20.0,
        fontFamily: 'Ubuntu',
        // fontWeight: FontWeight.bold,
      ),
      iconTheme: const IconThemeData(
        color: Colors.white,
      )
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    elevation: 25.0,
    backgroundColor: HexColor('181818'),
    selectedItemColor: HexColor('21b8c9'),
    selectedLabelStyle: const TextStyle(
      fontSize: 15.0,
      fontWeight: FontWeight.bold,
    ),
    unselectedItemColor: Colors.grey,
    unselectedLabelStyle: const TextStyle(
      fontSize: 14.0,
    ),
  ),
  navigationRailTheme: NavigationRailThemeData(
    elevation: 15,
    backgroundColor: HexColor('181818'),
    // iconTheme: MaterialStatePropertyAll(
    //   IconThemeData(
    //     size: 26.0,
    //     color: Colors.grey.shade100,
    //   ),
    // ),
  ),
  // textTheme: TextTheme(
  //   bodyText1: const TextStyle(
  //     color: Colors.white,
  //     fontSize: 20.0,
  //     height: 1.3,
  //     fontWeight: FontWeight.bold,
  //   ),
  //   bodyText2: TextStyle(
  //     color: Colors.grey.shade300,
  //   ),
  // ),
);