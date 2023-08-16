import 'package:flutter/material.dart';
import 'package:rapicredito/style/index.dart';


class AppTheme {
  AppTheme._();

  static ThemeData light = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colour.scaffoldBackground,
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    primaryColor: Colour.themeColor,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      centerTitle: true,
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(
        color: Colour.text33,
      ),
      titleTextStyle: TextStyle(
        color: Colour.text33,
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
      toolbarTextStyle: TextStyle(
        color: Colour.text33,
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      unselectedLabelStyle: TextStyle(fontSize: 12),
      selectedLabelStyle: TextStyle(fontSize: 12),
      unselectedItemColor: Color(0xffA2A5B9),
      selectedItemColor: Colour.themeColor,
    ),
    tabBarTheme: const TabBarTheme(
      indicatorSize: TabBarIndicatorSize.label,
      labelColor: Colour.themeColor,
      unselectedLabelColor: Colour.secondaryText,
    ),
    textSelectionTheme:
        const TextSelectionThemeData(cursorColor: Colour.themeColor),
    colorScheme: ColorScheme.fromSwatch()
        .copyWith(
          secondary: Colour.themeColor,
        )
        .copyWith(secondary: Colour.themeColor),
  );
}
