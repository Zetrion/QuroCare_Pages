import 'package:flutter/material.dart';
import '../../../core/app_colors.dart';
import '../../../core/app_fonts.dart';
import 'booking_for_widget.dart'; // for PatientData

class PatientSwitchSheet extends StatefulWidget {
  final PatientData? selected;

  const PatientSwitchSheet({
    Key? key,
    this.selected,
  }) : super(key: key);

  @override
  State<PatientSwitchSheet> createState() => _PatientSwitchSheetState();
}

class _PatientSwitchSheetState extends State<PatientSwitchSheet> {
  late PatientData _current;

  final List<PatientData> patients = const [
    PatientData(
      name: 'SIMOY RAJAN',
      relation: 'Self',
      genderAge: 'M • 21yr',
    ),
    PatientData(
      name: 'ABHISHEK JP',
      relation: 'Brother',
      genderAge: 'M • 21yr',
    ),
    PatientData(
      name: 'RAJAN P',
      relation: 'Father',
      genderAge: 'M • 54yr',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _current = widget.selected ?? patients.first;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
  color: Colors.transparent,
  child: Container(
    height: MediaQuery.of(context).size.height * 0.6,
    decoration: const BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
    child: Column(
      children: [
        // drag handle
        Container(
          width: 36,
          height: 4,
          margin: const EdgeInsets.only(bottom: 12),
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(2),
          ),
        ),

        Text(
          'Select patient',
          style: AppFonts.bodyBold.copyWith(
            fontSize: 16,
            color: AppColor.textDark,
          ),
        ),
        const SizedBox(height: 12),

        Expanded(
          child: ListView.separated(
            itemCount: patients.length,
            separatorBuilder: (_, __) => const SizedBox(height: 8),
            itemBuilder: (context, index) {
              final p = patients[index];
              final isSelected = p.name == _current.name;

              return GestureDetector(
                onTap: () {
                  Navigator.pop(context, p);
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12, vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: isSelected
                          ? AppColor.primary
                          : Colors.grey.shade300,
                    ),
                    color: isSelected
                        ? AppColor.primary.withOpacity(0.06)
                        : Colors.white,
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 18,
                        backgroundColor:
                            AppColor.primary.withOpacity(0.1),
                        child: Icon(Icons.person,
                            color: AppColor.primary, size: 20),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              p.name,
                              style: AppFonts.bodyBold.copyWith(
                                fontSize: 14,
                                color: AppColor.textDark,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              '${p.relation} • ${p.genderAge}',
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
                        color: isSelected
                            ? AppColor.primary
                            : Colors.grey,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    ),
  ),
);

  }
}
