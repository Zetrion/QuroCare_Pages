import 'package:flutter/material.dart';
import 'package:home_appointment_page/core/app_colors.dart';

class AppFonts {
  // Headings
  static const TextStyle heading1 = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w700,
    color: AppColor.textDark,
  );

  static const TextStyle subheading = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColor.textDark,
  );

  // Body Text
  static const TextStyle body = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColor.textGrey,
  );

  static const TextStyle bodyBold = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColor.textDark,
  );

  // Price Text
  static const TextStyle price = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: AppColor.textDark,
  );

  static const TextStyle basePrice = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: AppColor.textDark,
  );

  static const TextStyle estimatedPrice = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w700,
    color: AppColor.primaryBackground, // White on the continue button
  );

  // Add-on Status
  static const TextStyle addedStatus = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColor.successGreen,
  );

  static const TextStyle addCta = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColor.primaryPurple,
  );

  // Time and Helper Text
  static const TextStyle helperText = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColor.textLightGrey,
  );
}
