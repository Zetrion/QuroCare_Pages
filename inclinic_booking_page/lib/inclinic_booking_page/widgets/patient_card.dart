import 'package:flutter/material.dart';
import '/core/app_colors.dart';
import '/core/app_fonts.dart';

class PatientCard extends StatelessWidget {
  final String name;
  final String relation;
  final String age;
  final bool selected;
  final VoidCallback? onTap;

  const PatientCard({
    super.key,
    required this.name,
    required this.relation,
    required this.age,
    this.selected = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey.shade300),
          color: Colors.white,
        ),
        child: Row(
          children: [
            // avatar
            Container(
              width: 46,
              height: 46,
              decoration: BoxDecoration(
                color: AppColor.lightGrey,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.person, color: AppColor.primary),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: AppFonts.bodyBold.copyWith(fontSize: 14)),
                  const SizedBox(height: 4),
                  Text(
                    '$relation  *  M  *  $age',
                    style: AppFonts.caption.copyWith(
                      color: Colors.grey.shade700,
                    ),
                  ),
                ],
              ),
            ),
            // selection indicator
            Container(
              width: 34,
              height: 34,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: selected ? AppColor.primary : Colors.grey.shade300,
                  width: 3,
                ),
                color: selected
                    ? AppColor.primary.withOpacity(0.06)
                    : Colors.white,
              ),
              child: selected
                  ? const Icon(
                      Icons.check_circle,
                      color: AppColor.primary,
                      size: 18,
                    )
                  : const SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }
}
