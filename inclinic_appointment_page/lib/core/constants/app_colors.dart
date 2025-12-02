import 'package:flutter/material.dart';

abstract class AppColors {
  static const Color primary = Color(0xFF2C2196);
  static const Color white = Colors.white;
  static const Color black87 = Colors.black87;
  static const Color transparent = Colors.transparent;
  static const Color green = Colors.green;
  static const Color grey = Colors.grey;
  static const Color secondary =Color(0xFF5D91CE);
  static const Color gradientPrimary = Color(0xFF7C6AED);
  static const Color accentYellow = Color(0xFFFFCC00); 
  static const Color lightGreyBackground = Color(0xFFF7F7F7);
  static Color primaryWithOpacity(double opacity) => primary.withOpacity(opacity);

  static const Color primaryColor = Color(0xFF2C2196); 
  static const Color accentColor = Color(0xFFD1C4E9); // Light purple
  static const Color backgroundColor = Color(0xFFF3F2F8); // Light grey background
  static const Color cardColor = Colors.white;
  static const Color textColor = Colors.black87;
  static const Color lightTextColor = Colors.black54;
  static const Color errorColor = Colors.red;
  static const Color successColor = Colors.green;
  static const Color blueButtonColor = Color(0xFF673AB7); // A lighter purple for buttons
  static const Color deepBlue = Color(0xFF1A004B); // Deeper blue for confirmed page
  static const Color genderButtonActive = Color(0xFF651FFF); // Active gender button color
  static const Color genderButtonInactive = Color(0xFFE0E0E0); // Inactive gender button

  // Primary brand color (Deep Purple)
  static const Color primaryPurple = Color(0xFF4A148C); 
  // Secondary color (Lighter shade for accents/CTA)
  static const Color secondaryPurple = Color(0xFF673AB7);
  // Main background color (White)
  static const Color background = Color(0xFFFFFFFF);
  // Light grey for card backgrounds or dividers
  static const Color lightBackground = Color(0xFFF5F5F5);
  // Text color for headlines/body (Dark Gray)
  static const Color darkText = Color(0xFF212121);
  // White text, often used on colored backgrounds
  static const Color lightText = Color(0xFFFFFFFF);
  // Accent color from the images (Blue for Express Tag)
  static const Color blueAccent = Color(0xFF1976D2);
  // Green for success/icons (E.g., for the home icon in the address)
  static const Color successGreen = Color(0xFF4CAF50);
  // Gold for ratings
  static const Color starGold = Color(0xFFFFC107);
}