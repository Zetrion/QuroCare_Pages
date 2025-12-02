import 'package:flutter/material.dart';
import 'package:home_appointment_page/core/app_fonts.dart';
import 'package:home_appointment_page/core/app_colors.dart';

class ServiceItem extends StatelessWidget {
  final String title;
  final String price;
  final bool isAdded;
  final VoidCallback? onActionPressed;
  final bool showDelete;

  const ServiceItem({
    Key? key,
    required this.title,
    required this.price,
    this.isAdded = false,
    this.onActionPressed,
    this.showDelete = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Left Icon (Shield/Plus)
          Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: AppColor.primaryPurple.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Icon(
              Icons.shield_outlined,
              color: AppColor.primaryPurple,
              size: 24,
            ),
          ),
          const SizedBox(width: 12.0),

          // Title and Price
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(title, style: AppFonts.subheading.copyWith(fontSize: 15)),
                Text(price, style: AppFonts.helperText),
              ],
            ),
          ),

          // Action Button/Icon
          if (showDelete)
            IconButton(
              icon: const Icon(Icons.delete_outline, color: AppColor.deleteRed),
              onPressed: onActionPressed,
            )
          else if (isAdded)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: AppColor.successLight,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.check,
                    color: AppColor.successGreen,
                    size: 16,
                  ),
                  const SizedBox(width: 4),
                  Text('Added', style: AppFonts.addedStatus),
                ],
              ),
            )
          else
            OutlinedButton(
              onPressed: onActionPressed,
              style: OutlinedButton.styleFrom(
                side: const BorderSide(
                  color: AppColor.buttonBorder,
                  width: 1.5,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 8,
                ),
              ),
              child: Text('Add', style: AppFonts.addCta),
            ),
        ],
      ),
    );
  }
}
