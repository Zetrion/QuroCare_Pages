import 'package:flutter/material.dart';

class AppFonts {
  static const String fontFamily = 'Roboto'; // Example font family

  static TextStyle headlineStyle = TextStyle(
    fontFamily: fontFamily,
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Colors.black87,
  );

  static TextStyle subHeadlineStyle = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: Colors.black87,
  );

  static TextStyle bodyTextStyle = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    color: Colors.black87,
  );

  static TextStyle captionTextStyle = TextStyle(
    fontFamily: fontFamily,
    fontSize: 12,
    color: Colors.black54,
  );

  static TextStyle buttonTextStyle = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );
}