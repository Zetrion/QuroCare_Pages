import 'package:flutter/material.dart';
import 'package:inclinic_appointment_page/core/constants/app_colors.dart';

class PeriodSelector extends StatelessWidget {
  final List<String> periods;
  final String selectedPeriod;
  final Function(String) onPeriodSelected;

  const PeriodSelector({
    Key? key,
    required this.periods,
    required this.selectedPeriod,
    required this.onPeriodSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.primary, AppColors.gradientPrimary],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: const [0.25, 1.0],
        ),
        borderRadius: BorderRadius.circular(0),
      ),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 52),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: periods.map((period) {
            final isSelected = period == selectedPeriod;
            return GestureDetector(
              onTap: () => onPeriodSelected(period),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.secondary : Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  period,
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
