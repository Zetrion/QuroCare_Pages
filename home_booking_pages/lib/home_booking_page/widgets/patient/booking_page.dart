import 'package:flutter/material.dart';
import 'booking_for_widget.dart';
import '../patient/patient_switch_sheet.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({Key? key}) : super(key: key);

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  PatientData? selectedPatient;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Builder(
  builder: (pageContext) {
    return BookingForWidget(
      patient: selectedPatient,
      onEdit: () async {
  final overlayContext = Navigator.of(context).overlay!.context;

  final result = await showModalBottomSheet<PatientData>(
    context: overlayContext, // 🔥 FORCE overlay context
    isScrollControlled: true,
    backgroundColor: Colors.white,
    builder: (_) => PatientSwitchSheet(
      selected: selectedPatient,
    ),
  );

  if (!mounted) return;

  if (result != null) {
    setState(() {
      selectedPatient = result;
    });
  }
},

    );
  },
),

        ),
      ),
    );
  }
}
