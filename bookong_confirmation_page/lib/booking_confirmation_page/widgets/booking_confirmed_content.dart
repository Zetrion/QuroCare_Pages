import 'package:flutter/material.dart';
import '../../core/app_fonts.dart';

class BookingConfirmedContent extends StatelessWidget {
  const BookingConfirmedContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final shortestSide = size.shortestSide;

    // Badge size scales with screen, clamped for phones & tablets
    double badgeSize = shortestSide * 0.28;
    badgeSize = badgeSize.clamp(80.0, 140.0);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _ConfirmationBadge(size: badgeSize),
        const SizedBox(height: 24),

        // Title
        Text(
          'Booking Confirmed!',
          textAlign: TextAlign.center,
          style: AppFonts.bodyBold.copyWith(fontSize: 20, color: Colors.white),
        ),
        const SizedBox(height: 8),

        // Subtitle
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            "You'll receive a callback shortly for confirmation",
            textAlign: TextAlign.center,
            style: AppFonts.bodyRegular.copyWith(
              fontSize: 14,
              color: Colors.white.withOpacity(0.9),
            ),
          ),
        ),
      ],
    );
  }
}

class _ConfirmationBadge extends StatelessWidget {
  final double size;
  const _ConfirmationBadge({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Image.asset(
        'assets/check.png', 
        fit: BoxFit.contain,
      ),
    );
  }
}

