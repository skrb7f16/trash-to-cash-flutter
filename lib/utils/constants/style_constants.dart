import 'package:flutter/material.dart';

class StyleConstants {
  StyleConstants._();

  static const heading = TextStyle(fontSize: 20, fontWeight: FontWeight.w600);
  static const subheading = TextStyle(fontSize: 18, fontWeight: FontWeight.w600);
  static const primaryButton = ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.blue), padding: MaterialStatePropertyAll(EdgeInsets.all(10)), textStyle: MaterialStatePropertyAll(TextStyle(color: Colors.white, fontSize: 16)),);
  static const infoButton = ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.grey), padding: MaterialStatePropertyAll(EdgeInsets.all(10)), textStyle: MaterialStatePropertyAll(TextStyle(color: Colors.white, fontSize: 16)));

  static const boxShadow = BoxDecoration(boxShadow: [BoxShadow(
    color: Colors.grey,
    offset: Offset(
      5.0,
      5.0,
    ),
    blurRadius: 10.0,
    spreadRadius: 2.0,
  ), //BoxShadow
    BoxShadow(
      color: Colors.white,
      offset: Offset(0.0, 0.0),
      blurRadius: 0.0,
      spreadRadius: 0.0,
    )], borderRadius: BorderRadius.all(Radius.circular(10)),
  );
}