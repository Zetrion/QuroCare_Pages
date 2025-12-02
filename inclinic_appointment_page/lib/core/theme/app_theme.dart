import 'package:flutter/material.dart';
import 'package:inclinic_appointment_page/core/constants/app_colors.dart';

abstract class AppTheme {
  static final ThemeData light = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      brightness: Brightness.light,
    ),

    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.white,

    appBarTheme: const AppBarTheme(
      centerTitle: true,
      elevation: 0,
      backgroundColor: Color.fromARGB(255, 23, 18, 65),
      foregroundColor: AppColors.white,
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: AppColors.white,
      ),
    ),

    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        color: AppColors.black87,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      
      bodyMedium: TextStyle(
        color: AppColors.black87,
        fontSize: 14,
      ),
    ),
  );
}

