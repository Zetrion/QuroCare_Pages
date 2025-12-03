import 'package:flutter/material.dart';
import '../../core/app_colors.dart';
import '../../core/app_fonts.dart';

class HomeDoctorCard extends StatelessWidget {
  const HomeDoctorCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final height = width * 0.40;

        return SizedBox(
          height: height,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [AppColor.primary, AppColor.secondary],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Stack(
                children: [
                  /// BIG CAR – fully fills left half, touching left edge
                  Align(
                    alignment: Alignment.centerLeft,
                    child: SizedBox(
                      width: width * 0.52, // make it a bit bigger
                      height: height,
                      child: Image.asset(
                        'assets/car.png',
                        fit: BoxFit.cover, // fills the area, looks bigger
                      ),
                    ),
                  ),

                  /// TEXT – right side, everything centred as one group
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: SizedBox(
                        width: width * 0.48,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // Title
                            Text(
                              'HOME DOCTOR CONSULTATION',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style: AppFonts.bodyBold.copyWith(
                                fontSize: 14,
                                color: Colors.white,
                                letterSpacing: 0.8,
                              ),
                            ),
                            const SizedBox(height: 8),

                            // Group under the title that should feel centred
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 14,
                                    vertical: 4,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.18),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Text(
                                    'Scheduled for:',
                                    style: AppFonts.bodyRegular.copyWith(
                                      fontSize: 11,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10),

                                Text(
                                  'Time:',
                                  textAlign: TextAlign.center,
                                  style: AppFonts.bodyRegular.copyWith(
                                    fontSize: 11,
                                    color: Colors.white.withOpacity(0.8),
                                  ),
                                ),
                                Text(
                                  '4:00PM - 4:00PM',
                                  textAlign: TextAlign.center,
                                  style: AppFonts.bodyBold.copyWith(
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  'Date:',
                                  textAlign: TextAlign.center,
                                  style: AppFonts.bodyRegular.copyWith(
                                    fontSize: 11,
                                    color: Colors.white.withOpacity(0.8),
                                  ),
                                ),
                                Text(
                                  '25TH Sunday 2025',
                                  textAlign: TextAlign.center,
                                  style: AppFonts.bodyBold.copyWith(
                                    fontSize: 14,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
