import 'package:flutter/material.dart';
import 'package:home_appointment_page/services_details_page/view/service_details_page.dart';
import 'package:home_appointment_page/core/app_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Qurocare Service Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppColor.primaryPurple,
        scaffoldBackgroundColor: AppColor.primaryBackground,
        fontFamily: 'Roboto', 
        useMaterial3: true,
      ),
      home: const ServiceDetailPage(),
    );
  }
}