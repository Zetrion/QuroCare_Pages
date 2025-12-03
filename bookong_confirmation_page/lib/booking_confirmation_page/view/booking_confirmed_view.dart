import 'package:flutter/material.dart';
import '../../core/app_colors.dart';
import '../widgets/booking_confirmed_content.dart';

class BookingConfirmedView extends StatelessWidget {
  const BookingConfirmedView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primary, // deep purple bg
      body: SafeArea(
        child: Center(
          child: BookingConfirmedContent(),
        ),
      ),
    );
  }
}
