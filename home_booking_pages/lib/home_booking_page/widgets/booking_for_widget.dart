import 'package:flutter/material.dart';
import '../../core/app_colors.dart';
import '../../core/app_fonts.dart';
import 'package:home_booking_pages/home_booking_page/exports.dart';

class BookingForWidget extends StatefulWidget {
  const BookingForWidget({Key? key}) : super(key: key);

  @override
  State<BookingForWidget> createState() => _BookingForWidgetState();
}

class _BookingForWidgetState extends State<BookingForWidget> {
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
      decoration: _cardDecoration,
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'I am booking for',
            style: AppFonts.bodyBold.copyWith(
              fontSize: 15,
              color: AppColor.textDark,
            ),
          ),
          const SizedBox(height: 12),
          Column(
            children: [
              for (int i = 0; i < patients.length; i++) ...[
                PatientTile(
                  name: patients[i].name,
                  relation: patients[i].relation,
                  genderAge: patients[i].genderAge,
                  isSelected: selectedIndex == i,
                  onTap: () {
                    setState(() => selectedIndex = i);
                  },
                ),
                if (i != patients.length - 1) const SizedBox(height: 8),
              ],
            ],
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: () async {
                final newPatient = await showModalBottomSheet<PatientData>(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  // optional: adjust barrier color if you want a different overlay
                  // barrierColor: Colors.black54,
                  builder: (ctx) => const AddPatientSheet(),
                );

                if (newPatient != null) {
                  setState(() {
                    patients.add(newPatient);
                    selectedIndex = patients.length - 1;
                  });
                }
              },
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: AppColor.primary),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
                ),
              ),
              icon: Icon(
                Icons.add_circle_outline_rounded,
                color: AppColor.primary,
              ),
              label: Text(
                'Add new Patient',
                style: AppFonts.bodyBold.copyWith(
                  fontSize: 14,
                  color: AppColor.primary,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PatientTile extends StatelessWidget {
  final String name;
  final String relation;
  final String genderAge;
  final bool isSelected;
  final VoidCallback onTap;

  const PatientTile({
    Key? key,
    required this.name,
    required this.relation,
    required this.genderAge,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: isSelected
              ? AppColor.primary.withOpacity(0.06)
              : Colors.grey.shade50,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? AppColor.primary : Colors.grey.shade300,
            width: 1,
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        child: Row(
          children: [
            CircleAvatar(
              radius: 18,
              backgroundColor: AppColor.primary.withOpacity(0.1),
              child: Icon(Icons.person, color: AppColor.primary, size: 20),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: AppFonts.bodyBold.copyWith(
                      fontSize: 14,
                      color: AppColor.textDark,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    '$relation • $genderAge',
                    style: AppFonts.bodyRegular.copyWith(
                      fontSize: 12,
                      color: AppColor.textLight,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              isSelected
                  ? Icons.radio_button_checked
                  : Icons.radio_button_unchecked,
              color: isSelected ? AppColor.primary : Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}

final BoxDecoration _cardDecoration = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.circular(16),
  boxShadow: [
    BoxShadow(
      color: Colors.black.withOpacity(0.04),
      blurRadius: 8,
      offset: const Offset(0, 3),
    ),
  ],
);

class PatientData {
  final String name;
  final String relation;
  final String genderAge;
  const PatientData({
    required this.name,
    required this.relation,
    required this.genderAge,
  });
}
