import 'package:flutter/material.dart';
import '../../../core/app_colors.dart';
import '../../../core/app_fonts.dart';
import '../../exports.dart';

class CareItem extends StatelessWidget {
  final String title;
  final String price;
  final bool isAdded;

  const CareItem({
    required this.title,
    required this.price,
    required this.isAdded,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          /// Icon
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: AppColor.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(Icons.shield_outlined, color: AppColor.primary),
          ),

          const SizedBox(width: 12),

          /// Text
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppFonts.bodyMedium.copyWith(color: AppColor.textDark),
                ),
                const SizedBox(height: 4),
                Text(
                  price,
                  style: AppFonts.bodyRegular.copyWith(
                    color: AppColor.textLight,
                  ),
                ),
              ],
            ),
          ),

          /// Action button
          isAdded ? AddedChip() : AddButton(),
        ]
      ),
    );
  }
}
