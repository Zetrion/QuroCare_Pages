import 'package:flutter/material.dart';
import '../../../core/app_colors.dart';
import '../../../core/app_fonts.dart';
import '../../exports.dart';

class AddMoreCareCard extends StatelessWidget {
  const AddMoreCareCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColor.primary,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Title
          Text(
            'Add More Care to Your Visit',
            style: AppFonts.bodyBold.copyWith(
              color: Colors.white,
              fontSize: 16,
            ),
          ),

          const SizedBox(height: 16),

          /// Items
          CareItem(title: 'Glucose Test', price: 'INR 599', isAdded: true),
          const SizedBox(height: 12),
          CareItem(title: 'Glucose Test', price: 'INR 599', isAdded: true),
          const SizedBox(height: 12),
          CareItem(title: 'Glucose Test', price: 'INR 599', isAdded: false),

          const SizedBox(height: 20),

          /// View all button
          Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
              decoration: BoxDecoration(
                color: AppColor.secondary.withOpacity(0.4),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Text(
                'View all',
                style: AppFonts.bodyMedium.copyWith(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
