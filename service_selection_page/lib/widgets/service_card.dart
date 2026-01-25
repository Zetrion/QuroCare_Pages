import 'package:flutter/material.dart';
import '../core/exports.dart';
import '../models/service_model.dart';

class ServiceCard extends StatelessWidget {
  final ServiceModel service;
  final bool isSelected;
  final VoidCallback onTap;

  const ServiceCard({
    required this.service,
    this.isSelected = false,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AspectRatio(
        // Ensures the card scales proportionally
        aspectRatio: 1, 
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: isSelected
                ? AppColors.cardBackgroundSelected
                : AppColors.cardBackgroundLight,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              if (!isSelected) // Slight shadow only if not selected
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 3,
                ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                service.title,
                style: AppStyles.serviceTitle,
              ),
              Text(
                service.subtitle,
                style: AppStyles.serviceSubtitle,
              ),
              const Spacer(),
              // Placeholder for the service image (e.g., doctor/nurse)
              // In a real app, use Image.asset(service.imagePath)
              Align(
                alignment: Alignment.bottomRight,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                    child: Image.asset(
                      service.imagePath,
                      // Ensure the image scales nicely within the available space
                      fit: BoxFit.contain, 
                      alignment: Alignment.bottomLeft,
                      // You may need to constrain height if images are too tall
                      height: 80, 
                      errorBuilder: (context, error, stackTrace) => Container(
                        height: 80,
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          'Image Placeholder',
                          style: TextStyle(fontSize: 10),
                        ),
                      ),
                    ),
                  ),
                    const SizedBox(width: 8),
                    // Purple Arrow Button
                    Container(
                      decoration: const BoxDecoration(
                        color: AppColors.primaryPurple,
                        shape: BoxShape.circle,
                      ),
                      padding: const EdgeInsets.all(8),
                      child: const Icon(
                        Icons.arrow_forward,
                        color: AppColors.white,
                        size: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}