import 'package:flutter/material.dart';

abstract class mStyles {
  static const TextStyle normalText = TextStyle(
      fontFamily: 'OpenSans',
      fontSize: 16,
      color: Colors.black,
      fontWeight: FontWeight.w600);

  static const TextStyle normalTextWhite = TextStyle(
      fontFamily: 'OpenSans',
      fontSize: 16,
      color: Colors.white,
      fontWeight: FontWeight.w600);

  static const TextStyle boldText = TextStyle(
      fontFamily: 'OpenSans',
      fontSize: 24,
      color: Colors.black,
      fontWeight: FontWeight.w700);

  static const TextStyle boldTextWhite = TextStyle(
      color: Colors.white,
      fontFamily: 'OpenSans',
      fontSize: 24,
      fontWeight: FontWeight.w700);

  static const TextStyle bigMotivationTextWhite = TextStyle(
      color: Colors.white,
      fontFamily: 'OpenSans',
      fontSize: 24,
      fontWeight: FontWeight.w700,
      letterSpacing: -1,
      wordSpacing: -1,
      height: 1.1,
      shadows: [
        Shadow(
          color: Colors.black,
          offset: Offset(0, 0),
          blurRadius: 5,
        ),
      ]);
  static const TextStyle normalQuotTextWhite = TextStyle(
      color: Colors.white,
      fontFamily: 'OpenSans',
      fontSize: 18,
      fontWeight: FontWeight.w600,
      letterSpacing: -1,
      wordSpacing: -1,
      height: 1.1,
      shadows: [
        Shadow(
          color: Colors.black,
          offset: Offset(0, 0),
          blurRadius: 5,
        ),
      ]);
}
