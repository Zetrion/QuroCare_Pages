import 'package:flutter/material.dart';
import '../../core/app_colors.dart';
import '../../core/app_fonts.dart';

class BottomConfirmBar extends StatelessWidget {
  final String label; // e.g. "To pay at the clinic"
  final String amountText; // e.g. "₹ 90/-"
  final String buttonText; // e.g. "Confirm"
  final bool isEnabled;
  final VoidCallback? onPressed;

  const BottomConfirmBar({
    Key? key,
    required this.label,
    required this.amountText,
    required this.buttonText,
    this.isEnabled = true,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double radius = 28;

    return Opacity(
      opacity: isEnabled ? 1 : 0.6,
      child: GestureDetector(
        onTap: isEnabled ? onPressed : null,
        child: Container(
          decoration: BoxDecoration(
            color: AppColor.secondary,
            borderRadius: BorderRadius.circular(radius),
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                blurRadius: 12,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(radius),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // 🔹 TOP STRIP: stopwatch + EXPRESS image
                Container(
                  width: double.infinity,
                  height: 30, // perfect balance
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  color: Colors.transparent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // Flexible(
                      //   child: FittedBox(
                      //     fit: BoxFit.contain,
                      //     child: Image.asset('assets/stopwatch.png', width: 30),
                      //   ),
                      // ),
                      const SizedBox(width: 6),
                      /**Flexible(
                        child: FittedBox(
                          fit: BoxFit.contain,
                          child: Opacity(
                            opacity: 0.55,
                            child: Image.asset(
                              'assets/express.png',
                              width: 125,
                            ),
                          ),
                        ),
                      ),*/
                      Flexible(
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Opacity(
                            opacity: 0.8, // similar “soft” feel as the asset
                            child: Text(
                              '29 Sep 2025, Today',
                              style: AppFonts.bodyBold.copyWith(
                                fontSize: 28, // base size, FittedBox will scale
                                fontWeight: FontWeight.w900, // extra bold
                                fontStyle:
                                    FontStyle.italic, // slanted like the logo
                                letterSpacing: 1.2, // tight, logo-like spacing
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // 🔹 MAIN DEEP BLUE AREA
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColor.primary,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(radius),
                      topRight: Radius.circular(radius),
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 14,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // LEFT: label + amount
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            label,
                            style: AppFonts.bodyRegular.copyWith(
                              fontSize: 13,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 3),
                          Text(
                            amountText,
                            style: AppFonts.bodyBold.copyWith(
                              fontSize: 22,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),

                      // RIGHT: buttonText + chevron
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            buttonText,
                            style: AppFonts.bodyBold.copyWith(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(width: 4),
                          const Icon(
                            Icons.chevron_right,
                            color: Colors.white,
                            size: 22,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
