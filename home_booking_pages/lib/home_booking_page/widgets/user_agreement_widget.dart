import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../core/app_colors.dart';
import '../../core/app_fonts.dart';

class UserAgreementWidget extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const UserAgreementWidget({
    Key? key,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: _cardDecoration,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Checkbox(
            value: value,
            onChanged: (v) => onChanged(v ?? false),
            activeColor: AppColor.primary,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          const SizedBox(width: 4),
          Expanded(
            child: RichText(
              text: TextSpan(
                style: AppFonts.bodyRegular.copyWith(
                  fontSize: 12,
                  color: AppColor.textDark,
                ),
                children: [
                  const TextSpan(text: 'By proceeding, I agree to Qurocare’s '),
                  _linkSpan(context, label: 'User Agreement', onTap: () {}),
                  const TextSpan(text: ' , '),
                  _linkSpan(context, label: 'Terms of Service', onTap: () {}),
                  const TextSpan(text: ' and '),
                  _linkSpan(
                    context,
                    label: 'Cancellation & Hotel Booking Policies',
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  TextSpan _linkSpan(
    BuildContext context, {
    required String label,
    required VoidCallback onTap,
  }) {
    return TextSpan(
      text: label,
      style: AppFonts.bodyBold.copyWith(
        fontSize: 12,
        color: Colors.blue.shade800,
      ),
      recognizer: TapGestureRecognizer()..onTap = onTap,
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
