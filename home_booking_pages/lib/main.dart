import 'package:flutter/material.dart';
import 'package:home_booking_pages/home_booking_page/views/home_booking_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Review Booking',
      theme: ThemeData(fontFamily: 'Poppins', useMaterial3: true),
      home: const ReviewBookingView(),
    );
  }
}
