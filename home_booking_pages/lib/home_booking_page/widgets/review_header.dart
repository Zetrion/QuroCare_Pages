import 'package:flutter/material.dart';
import '../../core/app_colors.dart';
import '../../core/app_fonts.dart';

class ReviewHeader extends StatelessWidget {
  const ReviewHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.primary, 
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(2),
      child: Container(
        decoration: BoxDecoration(
          color: AppColor.primary,
          borderRadius: BorderRadius.circular(14),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: AppColor.textLight,
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.all(8),
              child: Icon(
                Icons.home_rounded,
                color: AppColor.background ,
                size: 20,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Home',
                    style: AppFonts.bodyBold.copyWith(
                      fontSize: 15,
                      color: AppColor.background,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    'Sra 30, Near Shastra Bike Service Centre Road,\n'
                    'Thozhukkal, Neyyattinkara, Kerala, India',
                    style: AppFonts.bodyRegular.copyWith(
                      fontSize: 12,
                      color: AppColor.background,
                      height: 1.3,
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              icon: Icon(Icons.edit_rounded, color: AppColor.background, size: 18),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class SlotChipWidget extends StatelessWidget {
  final String slotTime;
  const SlotChipWidget({Key? key, required this.slotTime}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: AppColor.primary.withOpacity(0.08),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColor.primary),
      ),
      child: Row(
        children: [
          Text(
            'Slot : ',
            style: AppFonts.bodyRegular.copyWith(
              fontSize: 12,
              color: AppColor.textDark,
            ),
          ),
          Text(
            slotTime,
            style: AppFonts.bodyBold.copyWith(
              fontSize: 12,
              color: AppColor.primary,
            ),
          ),
        ],
      ),
    );
  }
}
