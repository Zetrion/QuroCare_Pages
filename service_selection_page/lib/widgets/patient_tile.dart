import 'package:flutter/material.dart';
import '../core/app_colors.dart';
import '../core/app_styles.dart';

class PatientTile extends StatelessWidget {
  final String name;
  final String relation;
  final String genderAge;
  final bool isSelected;
  final VoidCallback onTap;

  const PatientTile({
    super.key,
    required this.name,
    required this.relation,
    required this.genderAge,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? AppColors.primaryPurple : Colors.transparent,
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(
                0.06,
              ), // Subtle shadow for each box
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 24,
              backgroundColor: AppColors.primaryPurple.withOpacity(0.1),
              child: const Icon(Icons.person, color: AppColors.primaryPurple),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: AppStyles.detailsTitle.copyWith(fontSize: 16),
                  ),
                  Text(
                    '$relation • $genderAge',
                    style: AppStyles.serviceSubtitle,
                  ),
                ],
              ),
            ),
            Icon(
              isSelected ? Icons.check_circle : Icons.radio_button_unchecked,
              color: isSelected ? AppColors.primaryPurple : Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
