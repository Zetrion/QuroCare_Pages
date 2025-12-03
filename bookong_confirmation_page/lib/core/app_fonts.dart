import 'package:flutter/material.dart';

class AppFonts {
  static const String _fontFamily = 'Poppins'; // change anytime

  static TextStyle bodyBold = const TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w600,
  );

  static TextStyle bodyRegular = const TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w400,
  );
}
