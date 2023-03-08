import 'package:flutter/material.dart';

class ThemeApp {
  static Color blueGrey = Color.fromRGBO(55, 71, 79, 1);
  
  static Color white = Color.fromRGBO(255, 255, 255, 1);

  static Color grey20 = Colors.grey.shade300;
  
  static Color black = Color.fromARGB(255, 0, 0, 0);

  static ThemeData themeData = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: grey20
  );
}