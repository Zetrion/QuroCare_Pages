import 'package:flutter/material.dart';
import '../core/exports.dart';
import '../models/service_model.dart';
import '../widgets/widgets.dart';
class ServiceSelectionPage extends StatefulWidget{
  const ServiceSelectionPage({super.key});

  @override 
  State<ServiceSelectionPage> createState() => _ServiceSelectionPageState();

} 
class _ServiceSelectionPageState extends State<ServiceSelectionPage>{
  ServiceModel? _selectedService;

  void _handleServiceSelection(ServiceModel service) {
    setState(() {
      _selectedService = _selectedService == service ? null : service;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.textDark),
          onPressed: () {
            
          },
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 24),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Choose the service you need',
                  style: AppStyles.header,
                ),
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20.0),
                child: ServiceGrid(
                  services: mockServices, // Using the dummy data
                  selectedService: _selectedService,
                  onServiceSelected: _handleServiceSelection,
                ),                
              )
            ),

            if (_selectedService != null)
              ServiceDetailsBottomPanel(service: _selectedService!),
          ],
        )
      )
      
    );
  }
}

  