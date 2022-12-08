import 'package:flutter/material.dart';

class Themes {
  ThemeData pinkTheme = ThemeData(
      primaryColor: Colors.pink,
      primarySwatch: Colors.pink,
      buttonTheme: const ButtonThemeData(buttonColor: Color.fromARGB(255, 235, 130, 165)));
  ThemeData purpleTheme = ThemeData(
      primaryColor: Colors.purple,
      primarySwatch: Colors.purple,
      buttonTheme: const ButtonThemeData(buttonColor: Colors.purpleAccent));
  ThemeData redTheme = ThemeData(
    primaryColor: Colors.red,
    primarySwatch: Colors.red,
    buttonTheme: const ButtonThemeData(buttonColor: Colors.redAccent),
  );
}
