import 'package:flutter/material.dart';
import 'package:inclinic_appointment_page/core/theme/app_theme.dart';
import 'package:inclinic_appointment_page/Inclinic_appointment_page/clinic_export.dart';
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quorocare',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      home: const ClinicAppointmentPage(),
    );
  }
}