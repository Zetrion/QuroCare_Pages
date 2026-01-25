import 'package:flutter/material.dart';
import '../core/app_colors.dart';
import '../core/app_styles.dart';
import '../models/patient_model.dart';
import '../views/add_patient_sheet.dart';
import 'patient_tile.dart';

class BookingForSheet extends StatefulWidget {
  const BookingForSheet({Key? key}) : super(key: key);

  @override
  State<BookingForSheet> createState() => _BookingForSheetState();
}

class _BookingForSheetState extends State<BookingForSheet> {
  int selectedIndex = 0;

  final List<PatientData> patients = [
    const PatientData(
      name: 'SIMOY RAJAN',
      relation: 'Self',
      genderAge: 'M • 21yr',
    ),
    const PatientData(
      name: 'ABHISHEK JP',
      relation: 'Brother',
      genderAge: 'M • 21yr',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 24),
      child: Column(
        mainAxisSize: MainAxisSize.min, // Sheet fits content
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'I am booking for',
            style: AppStyles.detailsTitle.copyWith(fontSize: 15),
          ),
          const SizedBox(height: 16),
          Column(
            children: [
              for (int i = 0; i < patients.length; i++) ...[
                PatientTile(
                  name: patients[i].name,
                  relation: patients[i].relation,
                  genderAge: patients[i].genderAge,
                  isSelected: selectedIndex == i,
                  onTap: () => setState(() => selectedIndex = i),
                ),
                const SizedBox(height: 12), // Spacing for shadows
              ],
            ],
          ),
          const SizedBox(height: 12),
          // --- Custom Gradient Add Button ---
          GestureDetector(
            onTap: () async {
              final newPatient = await showModalBottomSheet<PatientData>(
                context: context,
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                builder: (ctx) => const AddPatientSheet(),
              );

              if (newPatient != null) {
                setState(() {
                  patients.add(newPatient);
                  selectedIndex = patients.length - 1;
                });
              }
            },
            child: Container(
              width: double.infinity,
              height: 55, // Made it bigger
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: LinearGradient(
                  colors: [
                    const Color(0xFF231391),
                    const Color(0xFF231391).withOpacity(0.8),
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF231391).withOpacity(0.3),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.add_circle_outline_rounded,
                    color: Colors.white,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Add new Patient',
                    style: AppStyles.detailsTitle.copyWith(
                      fontSize: 16, // Bigger font
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
