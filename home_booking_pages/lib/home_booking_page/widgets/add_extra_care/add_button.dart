import 'package:flutter/material.dart';
import '../../../core/app_colors.dart';
import '../../../core/app_fonts.dart';

class AddedChip extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFFD9FFE5),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: const [
          Icon(Icons.check, size: 16, color: Color(0xFF2BB673)),
          SizedBox(width: 4),
          Text(
            'Added',
            style: TextStyle(
              color: Color(0xFF2BB673),
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class AddButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColor.primary),
      ),
      child: Text(
        'Add',
        style: AppFonts.bodyMedium.copyWith(color: AppColor.primary),
      ),
    );
  }
}
