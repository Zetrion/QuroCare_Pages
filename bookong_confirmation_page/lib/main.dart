import 'package:flutter/material.dart';
import 'package:bookong_confirmation_page/booking_confirmation_page/view/booking_confirmed_view.dart';
import 'core/app_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Booking Confirmed Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: AppColor.primary,
        useMaterial3: true,
      ),
      home: const BookingConfirmedView(),
    );
  }
}
