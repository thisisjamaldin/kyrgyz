import 'package:flutter/material.dart';

abstract class mColor {
  static Color light_grey = Color(int.parse("#F0F0F0".substring(1, 7), radix: 16) + 0xFF000000);
  static Color white = Color(int.parse("#FFFFFF".substring(1, 7), radix: 16) + 0xFF000000);
  static Color black_btn = Color(int.parse("#282828".substring(1, 7), radix: 16) + 0xFF000000);
  static Color white_bg = Color(int.parse("#FFFFFF".substring(1, 7), radix: 16) + 0xFF000000);
  static Color transparent = Color(int.parse("#FFFFFF".substring(1, 7), radix: 16) + 0xFF000000);
}