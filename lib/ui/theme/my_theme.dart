import 'package:flutter/material.dart';

class MyTheme {
  static Color lightPrimaryColor = Color(0xffB7935F);
  static Color darkPrimaryColor = Color(0xff141A2E);

  static var lightTheme = ThemeData(
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: AppBarTheme(
          elevation: 0,
          shadowColor: Colors.transparent,
          scrolledUnderElevation: 0,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          titleTextStyle: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w700,
              color: Color(0xff242424))),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: lightPrimaryColor,
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: Colors.white,
          showSelectedLabels: true,
          selectedLabelStyle: TextStyle(color: Colors.white),
          showUnselectedLabels: false,
          selectedIconTheme: IconThemeData(size: 34, color: Colors.black)),
      textTheme: TextTheme(
          titleLarge: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
          titleMedium: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
          bodyLarge: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
          bodyMedium: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
          bodySmall: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
          labelLarge: TextStyle(
            fontSize: 20, fontWeight: FontWeight.w500, color: Colors.black,)
      ),iconButtonTheme: IconButtonThemeData(style: ButtonStyle(iconColor: WidgetStateProperty.all(lightPrimaryColor))),
      colorScheme: ColorScheme.fromSeed(
          brightness: Brightness.light,
          seedColor: Color(0xffB7935F),
          primary: Colors.white,
          onPrimary: Colors.white));

  static var darkTheme = ThemeData(
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: AppBarTheme(
          elevation: 0,
          shadowColor: Colors.transparent,
          scrolledUnderElevation: 0,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          titleTextStyle: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w700,
              color: Color(0xff242424))),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: darkPrimaryColor,
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: Colors.white,
          showSelectedLabels: true,
          selectedLabelStyle: TextStyle(color: Colors.yellow),
          showUnselectedLabels: false,
          selectedIconTheme: IconThemeData(size: 34, color: Colors.yellow)),
      textTheme: TextTheme(
          titleLarge: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
          titleMedium: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
          bodyLarge: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
          bodyMedium: TextStyle(
              color: Color(0xffFACC1D),
              height: 1.6,
              leadingDistribution: TextLeadingDistribution.proportional,
              fontSize: 22
          ),
          bodySmall: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
          labelLarge: TextStyle(
            fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white,)
      ),
      iconButtonTheme: IconButtonThemeData(style: ButtonStyle(iconColor: WidgetStateProperty.all(Colors.yellow))),
      colorScheme: ColorScheme.fromSeed(
          brightness: Brightness.light,
          seedColor: darkPrimaryColor,
          primary: darkPrimaryColor,
          onPrimary: Colors.white));

}
