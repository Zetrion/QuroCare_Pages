import 'package:flutter/material.dart';
import '../models/appointment_slot.dart';
import '../../core/constants/app_colors.dart';

class TimeSlotGrid extends StatelessWidget {
  final List<TimeSlot> times;
  final String? selectedTime;
  final Function(String) onTimeSelected;

  const TimeSlotGrid({
    Key? key,
    required this.times,
    required this.selectedTime,
    required this.onTimeSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      crossAxisSpacing: 18,
      mainAxisSpacing: 18,
      childAspectRatio: 2.5,
      physics: const NeverScrollableScrollPhysics(),
      children: times.map((timeSlot) {
        final time = timeSlot.time;
        final isSelected = selectedTime == time;
        return GestureDetector(
          onTap: () => onTimeSelected(time),
          child: Container(
            decoration: BoxDecoration(
              color: isSelected ? AppColors.primary : Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColors.primary, width: 2),
            ),
            alignment: Alignment.center,
            child: Text(
              time,
              style: TextStyle(
                color: isSelected ? Colors.white : AppColors.black87,
                fontWeight: FontWeight.w600,
                fontSize: 15,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
