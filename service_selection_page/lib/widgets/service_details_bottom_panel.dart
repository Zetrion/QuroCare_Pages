import 'package:flutter/material.dart';
import '../core/exports.dart';
import '../models/service_model.dart';
import 'booking_for_sheet.dart';

class ServiceDetailsBottomPanel extends StatelessWidget {
  final ServiceModel service;

  const ServiceDetailsBottomPanel({required this.service, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // 1. Top Corners Rounded
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      clipBehavior:
          Clip.antiAlias, // Ensures child content (image) respects corners
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Top Image Section
          Image.asset(
            service.detailsImage,
            height: 220, // Slightly taller for bigger screens
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => Container(
              height: 220,
              color: AppColors.primaryDark,
              child: const Center(
                child: Text(
                  'Details Image',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),

          // Details Section
          Padding(
            padding: const EdgeInsets.all(
              24.0,
            ), // Increased padding for a cleaner look
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Qurocare Home Service',
                  style: AppStyles.serviceSubtitle.copyWith(
                    fontSize: 16,
                  ), // Bigger font
                ),
                const SizedBox(height: 6),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${service.title} ${service.subtitle}',
                      style: AppStyles.detailsTitle.copyWith(
                        fontSize: 20,
                      ), // Bigger font
                    ),

                    // 2. BOOK Button with Shadow, White background, and Purple text
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.primaryPurple.withOpacity(0.3),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled:
                                true, // Allows the sheet to adjust height
                            backgroundColor:
                                Colors.transparent, // Keeps corners rounded
                            builder: (context) => const BookingForSheet(),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.white, // White background
                          foregroundColor:
                              AppColors.primaryPurple, // Purple text
                          elevation:
                              0, // Elevation handled by Container shadow for better control
                          side: const BorderSide(
                            color: AppColors.primaryPurple,
                            width: 1,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 28,
                            vertical: 12,
                          ),
                        ),
                        child: const Text(
                          'BOOK',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),

                // Rating and Duration
                Row(
                  children: [
                    const Icon(
                      Icons.star,
                      color: AppColors.starYellow,
                      size: 20,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      '4.8 (57)',
                      style: AppStyles.ratingText.copyWith(fontSize: 16),
                    ),
                    const SizedBox(width: 20),
                    const Icon(
                      Icons.access_time,
                      color: AppColors.textGray,
                      size: 20,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      '30 mins',
                      style: AppStyles.ratingText.copyWith(fontSize: 16),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Description
                Text(
                  'With Qurocare Clinic Consultation, you can book appointments with trusted healthcare specialists at your convenience.',
                  style: AppStyles.serviceSubtitle.copyWith(
                    fontSize: 15,
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 24),

                // 3. Base Price - Centered and Purple
                Row(
                  mainAxisAlignment: MainAxisAlignment.center, // Centered
                  children: [
                    Text(
                      'Base Price : ',
                      style: AppStyles.serviceSubtitle.copyWith(
                        fontSize: 18,
                        color: AppColors.primaryPurple, // Purple color
                      ),
                    ),
                    Text(
                      'INR 1599',
                      style: AppStyles.basePrice.copyWith(
                        fontSize: 20,
                        color: AppColors.primaryPurple, // Purple color
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),

                // 4. Disclaimer - Centered
                Center(
                  child: Text(
                    '(Final price will be shown after selecting location)',
                    textAlign: TextAlign.center,
                    style: AppStyles.serviceSubtitle.copyWith(fontSize: 12),
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
