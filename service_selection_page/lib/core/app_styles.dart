import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppStyles {
  // Large Header Style
  static const TextStyle header = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.textDark,
  );

  // Service Title (e.g., 'Home Doctor')
  static const TextStyle serviceTitle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.textDark,
  );

  // Service Subtitle (e.g., 'Consultation')
  static const TextStyle serviceSubtitle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: AppColors.textGray,
  );

  // Details Panel Text Styles
  static const TextStyle detailsTitle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: AppColors.textDark,
  );

  static const TextStyle ratingText = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.textGray,
  );

  static const TextStyle basePrice = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: AppColors.textDark,
  );
}