import 'package:flutter/material.dart';

class TTCThemes {
  const TTCThemes._();

  static ThemeData lightTheme = ThemeData(
      useMaterial3: true,
      primaryColor: Colors.blue,
      scaffoldBackgroundColor: Colors.white,
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    primaryColor: Colors.blue,
    // scaffoldBackgroundColor: Colors.black,
  );
}