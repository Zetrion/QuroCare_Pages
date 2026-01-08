import 'package:flutter/material.dart';
import '../models/service_model.dart';
import 'service_card.dart';

class ServiceGrid extends StatelessWidget {
  final List<ServiceModel> services;
  final ServiceModel? selectedService;
  final Function(ServiceModel) onServiceSelected;

  const ServiceGrid({
    required this.services,
    required this.selectedService,
    required this.onServiceSelected,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      // The parent widget (ServiceSelectionView) will handle the scrolling
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(), 
      padding: EdgeInsets.zero,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16.0,
        mainAxisSpacing: 16.0,
        childAspectRatio: 1.0, // Cards are square (handled by ServiceCard AspectRatio)
      ),
      itemCount: services.length,
      itemBuilder: (context, index) {
        final service = services[index];
        return ServiceCard(
          service: service,
          // Check if the current service is the one that was tapped
          isSelected: selectedService == service, 
          onTap: () => onServiceSelected(service),
        );
      },
    );
  }
}