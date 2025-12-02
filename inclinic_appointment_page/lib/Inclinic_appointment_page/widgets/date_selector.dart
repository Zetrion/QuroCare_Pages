import 'package:flutter/material.dart';
import '../models/appointment_slot.dart';
import '../../core/constants/app_colors.dart';

class DateSelector extends StatelessWidget {
  final List<DateSlot> dates;
  final int selectedIndex;
  final Function(int) onDateSelected;

  const DateSelector({
    Key? key,
    required this.dates,
    required this.selectedIndex,
    required this.onDateSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primary,
      padding: const EdgeInsets.symmetric(vertical: 18),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(dates.length, (index) {
              final isSelected = index == selectedIndex;
              final date = dates[index];
              return GestureDetector(
                onTap: () => onDateSelected(index),
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 0,
                  ),
                  decoration: BoxDecoration(
                    color: isSelected ? AppColors.white : AppColors.primary,
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(color: AppColors.white, width: 2),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        date.day,
                        style: TextStyle(
                          color: isSelected
                              ? AppColors.black87
                              : AppColors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        date.date.split(' ')[0],
                        style: TextStyle(
                          color: isSelected
                              ? AppColors.black87
                              : AppColors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                      Text(
                        date.date.split(' ')[1],
                        style: TextStyle(
                          color: isSelected
                              ? AppColors.black87
                              : AppColors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
