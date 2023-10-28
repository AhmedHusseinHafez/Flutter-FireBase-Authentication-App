// ignore_for_file: prefer_const_declarations

import 'package:flutter/material.dart';

final primaryColor = Colors.teal;
final secondaryColor = Colors.white;

final appTheme = ThemeData(
    //IconsTheme
    iconTheme: IconThemeData(color: primaryColor),
    //appBarTheme
    appBarTheme: AppBarTheme(
      backgroundColor: primaryColor,
      centerTitle: true,
      elevation: 10,
    ),
    brightness: Brightness.light,
    primaryColor: primaryColor,
    colorScheme: ColorScheme.light(
      primary: primaryColor,
    ),

    //progressIndicatorTheme
    progressIndicatorTheme: ProgressIndicatorThemeData(color: primaryColor),
    //floatingActionButtonTheme
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: primaryColor,
      foregroundColor: secondaryColor,
    ),
    //inputDecorationTheme
    inputDecorationTheme: InputDecorationTheme(
      floatingLabelStyle: TextStyle(color: primaryColor),
      iconColor: secondaryColor,
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: secondaryColor),
        borderRadius: BorderRadius.circular(20),
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide(color: primaryColor),
        borderRadius: BorderRadius.circular(20),
      ),
    ),
    //elevatedButtonTheme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(primaryColor),
          foregroundColor: MaterialStateProperty.all(secondaryColor),
          iconColor: MaterialStateProperty.all(secondaryColor)),
    ));
