import 'package:flutter/material.dart';
import '../core/exports.dart';
import '../models/service_model.dart';

class ServiceDetailsBottomPanel extends StatelessWidget {
  final ServiceModel service;

  const ServiceDetailsBottomPanel({
    required this.service,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // This panel is structured as it appears in State 2
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Top Image Section (Qurocare van/details image)
        // In a real app, this would be an Image.asset/network
        Container(
          height: 200, // Fixed height for the details image
          decoration: BoxDecoration(
            color: AppColors.primaryDark, // Background color for the image area
            image: DecorationImage(
              // Using a placeholder for the image
              image: AssetImage(service.detailsImage), 
              fit: BoxFit.cover,
            ),
          ),
          child: const Center(child: Text('Details Image', style: TextStyle(color: AppColors.white))),
        ),

        // Details Text and Button Section
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Qurocare Home Service',
                style: AppStyles.serviceSubtitle,
              ),
              const SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${service.title} ${service.subtitle}',
                    style: AppStyles.detailsTitle,
                  ),
                  // BOOK button
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryPurple,
                      foregroundColor: AppColors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                    ),
                    child: const Text('BOOK'),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              // Rating and Duration
              Row(
                children: [
                  const Icon(Icons.star, color: AppColors.starYellow, size: 16),
                  const SizedBox(width: 4),
                  Text('4.8 (57)', style: AppStyles.ratingText),
                  const SizedBox(width: 16),
                  const Icon(Icons.access_time, color: AppColors.textGray, size: 16),
                  const SizedBox(width: 4),
                  Text('30 mins', style: AppStyles.ratingText),
                ],
              ),
              const SizedBox(height: 12),
              // Description
              Text(
                'With Qurocare Clinic Consultation, you can book appointments with trusted healthcare specialists at your convenience.',
                style: AppStyles.serviceSubtitle.copyWith(fontSize: 13),
              ),
              const SizedBox(height: 16),
              // Price
              Row(
                children: [
                  const Text('Base Price : ', style: AppStyles.serviceSubtitle),
                  Text('INR 1599', style: AppStyles.basePrice),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                '(Final price will be shown after selecting location)',
                style: AppStyles.serviceSubtitle.copyWith(fontSize: 10),
              ),
            ],
          ),
        ),
      ],
    );
  }
}