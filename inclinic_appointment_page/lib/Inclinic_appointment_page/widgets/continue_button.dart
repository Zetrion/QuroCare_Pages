import 'package:flutter/material.dart';
import 'package:inclinic_appointment_page/core/constants/app_colors.dart';

import '../models/appointment_slot.dart';

class ContinueButtonSection extends StatelessWidget {
  final DateSlot? selectedDate;
  final String? selectedPeriod;
  final String? selectedTime;
  //final Service? selectedService; // <- changed to Service?

  const ContinueButtonSection({
    super.key,
    this.selectedDate,
    this.selectedPeriod,
    this.selectedTime,
    //this.selectedService,
  });

  @override
  Widget build(BuildContext context) {
    final title =
        "${selectedDate?.date ?? ''}${(selectedPeriod != null && selectedPeriod!.isNotEmpty) ? ', $selectedPeriod' : ''}${(selectedTime != null && selectedTime!.isNotEmpty) ? ', $selectedTime' : ''}";

    return Container(
      decoration: BoxDecoration(
        color: AppColors.primary,
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            offset: const Offset(0, -2),
            blurRadius: 6,
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Selected Appointment',
                  style: TextStyle(color: Colors.white70, fontSize: 12),
                ),
                const SizedBox(height: 4),
                Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 8),
            ),
            child: const Row(
              children: [
                Text(
                  'Continue',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(width: 8),
                Icon(Icons.arrow_forward_ios, size: 16, color: Colors.white),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
