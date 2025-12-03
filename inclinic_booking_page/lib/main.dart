import 'package:flutter/material.dart';
import 'package:inclinic_booking_page/inclinic_booking_page/views/home_booking_page.dart';

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
