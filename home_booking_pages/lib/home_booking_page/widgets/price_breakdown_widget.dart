import 'package:flutter/material.dart';
import '../../core/app_colors.dart';
import '../../core/app_fonts.dart';

class PriceBreakdownWidget extends StatelessWidget {
  const PriceBreakdownWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: _cardDecoration,
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Price Breakdown',
            style: AppFonts.bodyBold.copyWith(
              fontSize: 15,
              color: AppColor.textDark,
            ),
          ),
          const SizedBox(height: 12),
          _row('Booking fee', '1599'),
          const SizedBox(height: 6),
          _row('Add-ons', '599'),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 12),
            child: Divider(height: 1),
          ),
          _row('Total Payable', '2198', isBold: true),
        ],
      ),
    );
  }

  Widget _row(String label, String value, {bool isBold = false}) {
    return Row(
      children: [
        Expanded(
          child: Text(
            label,
            style: (isBold ? AppFonts.bodyBold : AppFonts.bodyRegular).copyWith(
              fontSize: 14,
              color: AppColor.textDark,
            ),
          ),
        ),
        Text(
          value,
          style: (isBold ? AppFonts.bodyBold : AppFonts.bodyRegular).copyWith(
            fontSize: 14,
            color: AppColor.textDark,
          ),
        ),
      ],
    );
  }
}

final BoxDecoration _cardDecoration = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.circular(16),
  boxShadow: [
    BoxShadow(
      color: Colors.black.withOpacity(0.04),
      blurRadius: 8,
      offset: const Offset(0, 3),
    ),
  ],
);
