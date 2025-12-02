import 'package:flutter/material.dart';
import 'package:inclinic_appointment_page/core/constants/app_colors.dart';
import 'legend_item.dart';

class SlotInfoSection extends StatelessWidget {
  const SlotInfoSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 32),
      child: Column(
        children: const [
          Row(
            children: [
              LegendItem(color: Colors.green, text: "Available"),
              SizedBox(width: 12),
              LegendItem(color: Colors.grey, text: "Unavailable"),
            ],
          ),
          SizedBox(height: 6),
          Row(
            children: [LegendItem(color: Color(0xFF3B1C9B), text: "Selected")],
          ),
          SizedBox(height: 12),
        ],
      ),
    );
  }
}
