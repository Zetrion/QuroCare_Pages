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

         
          _row(
            'Booking fee',
            '1599',
            tooltipMessage:
                'Includes consultation charges, convenience fee and platform fee.',
          ),
          const SizedBox(height: 6),

          
          _row(
            'Add-ons',
            '599',
            tooltipMessage:
                'Additional services or items selected during booking.',
          ),

          const Padding(
            padding: EdgeInsets.symmetric(vertical: 12),
            child: Divider(height: 1),
          ),

          
          _row(
            'Total Payable',
            '2198',
            isBold: true,
            tooltipMessage: 'Final amount payable at the clinic.',
          ),
        ],
      ),
    );
  }

  Widget _row(
    String label,
    String value, {
    bool isBold = false,
    String? tooltipMessage,
  }) {
    final textStyle = (isBold ? AppFonts.bodyBold : AppFonts.bodyRegular)
        .copyWith(fontSize: 14, color: AppColor.textDark);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(label, style: textStyle),
            if (tooltipMessage != null) ...[
              const SizedBox(width: 4),
              Tooltip(
                message: tooltipMessage,
                triggerMode: TooltipTriggerMode.tap, 
                waitDuration: const Duration(milliseconds: 300),
                showDuration: const Duration(seconds: 3), 
                decoration: BoxDecoration(
                  color: Colors.black87,
                  borderRadius: BorderRadius.circular(8),
                ),
                textStyle: const TextStyle(color: Colors.white, fontSize: 12),
                child: Icon(
                  Icons.info_outline_rounded,
                  size: 16,
                  color: AppColor.textLight,
                ),
              ),
            ],
          ],
        ),

        
        Text(value, style: textStyle),
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
