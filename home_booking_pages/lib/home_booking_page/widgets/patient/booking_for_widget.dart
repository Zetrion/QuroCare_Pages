import 'package:flutter/material.dart';
import '../../../core/app_colors.dart';
import '../../../core/app_fonts.dart';

/// =======================
/// BOOKING FOR WIDGET
/// =======================
class BookingForWidget extends StatelessWidget {
  /// Patient data comes from parent page
  final PatientData? patient;

  /// Edit callback handled by parent
  final VoidCallback? onEdit;

  const BookingForWidget({
    Key? key,
    this.patient,
    this.onEdit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Default fallback
    final displayPatient = patient ??
        const PatientData(
          name: 'SIMOY RAJAN',
          relation: 'Self',
          genderAge: 'M • 21yr',
        );

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

          _SinglePatientTile(
            patient: displayPatient,
            onEdit: onEdit,
          ),
        ],
      ),
    );
  }
}

/// =======================
/// SINGLE PATIENT TILE
/// =======================
class _SinglePatientTile extends StatelessWidget {
  final PatientData patient;
  final VoidCallback? onEdit;

  const _SinglePatientTile({
    Key? key,
    required this.patient,
    this.onEdit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
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
                  patient.name,
                  style: AppFonts.bodyBold.copyWith(
                    fontSize: 14,
                    color: AppColor.textDark,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  '${patient.relation} • ${patient.genderAge}',
                  style: AppFonts.bodyRegular.copyWith(
                    fontSize: 12,
                    color: AppColor.textLight,
                  ),
                ),
              ],
            ),
          ),

          GestureDetector(
  behavior: HitTestBehavior.opaque,
  onTap: () {
    debugPrint('EDIT CLICKED');
    onEdit?.call();
  },
  child: const Padding(
    padding: EdgeInsets.all(6),
    child: Icon(
      Icons.edit_outlined,
      size: 18,
      color: Colors.grey,
    ),
  ),
),

        ],
      ),
    );
  }
}

/// =======================
/// PATIENT MODEL
/// =======================
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

/// =======================
/// CARD DECORATION
/// =======================
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
