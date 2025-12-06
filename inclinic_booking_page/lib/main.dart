import 'package:flutter/material.dart';
import 'package:inclinic_booking_page/inclinic_booking_page/views/review_booking_page.dart';
import 'core/app_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Booking Review',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColor.pale,
        primaryColor: AppColor.primary,
        fontFamily: 'Roboto',
      ),
      home: const ReviewBookingPage(),
    );
  }
}
