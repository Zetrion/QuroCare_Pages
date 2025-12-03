import 'package:flutter/material.dart';
import '../../core/app_colors.dart';
import '../../core/app_fonts.dart';

class BookingForWidget extends StatelessWidget {
  const BookingForWidget({Key? key}) : super(key: key);

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
            children: const [
              PatientTile(
                name: 'SIMOY RAJAN',
                relation: 'Self',
                genderAge: 'M • 21yr',
                isSelected: true,
              ),
              SizedBox(height: 8),
              PatientTile(
                name: 'ABHISHEK JP',
                relation: 'Brother',
                genderAge: 'M • 21yr',
                isSelected: false,
              ),
            ],
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: () {},
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

  const PatientTile({
    Key? key,
    required this.name,
    required this.relation,
    required this.genderAge,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
