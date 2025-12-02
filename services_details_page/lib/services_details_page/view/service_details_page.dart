import 'package:flutter/material.dart';
import 'package:home_appointment_page/core/app_colors.dart';
import 'package:home_appointment_page/core/app_fonts.dart';
import '../widgets/rounded_shadow_card.dart';
import '../widgets/service_item.dart';
import '../widgets/continue_button.dart';

// --- Mock Data Structures ---
class Service {
  final String id;
  final String title;
  final double price;
  final bool isAdded;

  Service({
    required this.id,
    required this.title,
    required this.price,
    this.isAdded = false,
  });
}

class ServiceDetailPage extends StatefulWidget {
  const ServiceDetailPage({super.key});

  @override
  State<ServiceDetailPage> createState() => _ServiceDetailPageState();
}

class _ServiceDetailPageState extends State<ServiceDetailPage> {
  final double basePrice = 1599.0;
  List<Service> addedServices = [
    Service(id: 'bp', title: 'Blood Pressure Check', price: 599, isAdded: true),
    Service(id: 'glucose', title: 'Glucose Test', price: 599, isAdded: true),
  ];

  List<Service> allAddOns = [
    Service(id: 'g1', title: 'Glucose Test', price: 599, isAdded: true),
    Service(id: 'flu1', title: 'Instant Flu Test', price: 599),
    Service(id: 'flu2', title: 'Instant Flu Test', price: 599),
    Service(id: 'flu3', title: 'Instant Flu Test', price: 599),
    Service(id: 'tsh', title: 'TSH Test (Thyroid)', price: 899),
    Service(id: 'vitd', title: 'Vitamin D Test', price: 1299),
    Service(id: 'b12', title: 'Vitamin B12 Test', price: 799),
    Service(id: 'ecg', title: 'ECG Analysis', price: 499),
  ];

  double get estimatedPrice =>
      basePrice + addedServices.fold(0.0, (sum, item) => sum + item.price);

  void _removeService(String id) {
    setState(() {
      addedServices.removeWhere((s) => s.id == id);
    });
  }

  void _showAllAddOns(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext ctx) {
        return StatefulBuilder(
          builder: (ctx, setModalState) {
            final double addOnTotal = addedServices.fold(
              0.0,
              (sum, item) => sum + item.price,
            );

            final List<Service> displayAddOns = allAddOns.map((addOn) {
              return Service(
                id: addOn.id,
                title: addOn.title,
                price: addOn.price,
                isAdded: addedServices.any((s) => s.id == addOn.id),
              );
            }).toList();

            toggleAddOn(Service service) {
              setModalState(() {
                if (addedServices.any((s) => s.id == service.id)) {
                  addedServices.removeWhere((s) => s.id == service.id);
                } else {
                  addedServices.add(service);
                }
              });
              setState(() {});
            }

            return Container(
              height: MediaQuery.of(context).size.height * 0.85,
              decoration: const BoxDecoration(
                color: AppColor.primaryBackground,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 100),
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 20,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Container(
                              width: 40,
                              height: 5,
                              margin: const EdgeInsets.only(bottom: 10),
                              decoration: BoxDecoration(
                                color: AppColor.sheetHandle,
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Available Add-ons',
                                style: AppFonts.heading1.copyWith(fontSize: 18),
                              ),
                              GestureDetector(
                                onTap: () => Navigator.pop(context),
                                child: const Icon(
                                  Icons.close,
                                  color: AppColor.textDark,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          ...displayAddOns.map((s) {
                            return ServiceItem(
                              title: s.title,
                              price: 'INR ${s.price.toInt()}',
                              isAdded: s.isAdded,
                              onActionPressed: () => toggleAddOn(s),
                            );
                          }).toList(),
                          const SizedBox(height: 100),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      padding: EdgeInsets.only(
                        left: 20,
                        right: 20,
                        top: 15,
                        bottom: MediaQuery.of(context).padding.bottom + 15,
                      ),
                      decoration: const BoxDecoration(
                        color: AppColor.primaryBackground,
                        border: Border(
                          top: BorderSide(
                            color: AppColor.dividerColor,
                            width: 1,
                          ),
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Add-on Total:', style: AppFonts.bodyBold),
                              Text(
                                'INR ${addOnTotal.toInt()}',
                                style: AppFonts.price.copyWith(
                                  color: AppColor.textDark,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 15),
                          SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: () => Navigator.pop(context),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColor.primaryPurple,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Text(
                                'Confirm Selections',
                                style: AppFonts.bodyBold.copyWith(
                                  color: AppColor.primaryBackground,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColor.textDark),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Stack(
        children: [
          /// MAIN SCROLL PAGE
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// IMAGE SECTION 
                Container(
                  height: screenHeight * 0.42,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/bg.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                /// WHITE PANEL CONTENT
                Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: AppColor.primaryBackground,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(
                      bottom: screenHeight * 0.20,
                      top: 20,
                    ),
                    child: Column(
                      children: [
                        /// MAIN CARD
                        // Floating card: 10% over image, rest on white
                        Transform.translate(
                          offset: const Offset(
                            0,
                            -80,
                          ), // move upward 40px (tweak if needed)
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: RoundedShadowCard(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  /// Service Source Title
                                  Text(
                                    'Qurocare Home Service',
                                    style: AppFonts.body.copyWith(
                                      fontSize: 13,
                                      color: AppColor.primaryPurple,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),

                                  const SizedBox(height: 4),

                                  /// Main Title
                                  Text(
                                    'Doctor Consultation',
                                    style: AppFonts.heading1.copyWith(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w700,
                                      color: AppColor.textDark,
                                    ),
                                  ),

                                  const SizedBox(height: 8),

                                  /// Description
                                  Text(
                                    'With Qurocare Clinic Consultation, you can book appointments with trusted healthcare specialists at your convenience.',
                                    style: AppFonts.body.copyWith(
                                      fontSize: 14,
                                      height: 1.35,
                                      color: AppColor.textDark.withOpacity(
                                        0.85,
                                      ),
                                    ),
                                  ),

                                  const SizedBox(height: 16),

                                  /// Duration Row
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.watch_later_outlined,
                                        size: 18,
                                        color: AppColor.primaryPurple,
                                      ),
                                      const SizedBox(width: 8),
                                      Text(
                                        '30 mins',
                                        style: AppFonts.body.copyWith(
                                          fontSize: 14,
                                          color: AppColor.textDark.withOpacity(
                                            0.95,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),

                                  const SizedBox(height: 10),

                                  /// Bullet Row
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.list_alt,
                                        size: 18,
                                        color: AppColor.textGrey,
                                      ),
                                      const SizedBox(width: 8),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Consultation , Blood Test, Vital check...',
                                              style: AppFonts.body.copyWith(
                                                fontSize: 14,
                                                color: AppColor.textDark
                                                    .withOpacity(0.95),
                                              ),
                                            ),
                                            const SizedBox(height: 1),
                                            Text(
                                              '+more',
                                              style: AppFonts.body.copyWith(
                                                color: AppColor.primaryPurple,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 14,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),

                                  const SizedBox(height: 18),

                                  /// Divider
                                  Divider(
                                    height: 1,
                                    thickness: 1,
                                    color: AppColor.dividerColor,
                                  ),

                                  const SizedBox(height: 18),

                                  /// Price Row
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      // First line: "Base Price :  INR 1599"
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Base Price : ',
                                            style: AppFonts.bodyBold.copyWith(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600,
                                              color: AppColor.textDark,
                                            ),
                                          ),
                                          Text(
                                            'INR ${basePrice.toInt()}',
                                            style: AppFonts.basePrice.copyWith(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w700,
                                              color: AppColor.textDark,
                                            ),
                                          ),
                                        ],
                                      ),

                                      const SizedBox(height: 4),

                                      // Second line: helper text, centered
                                      Text(
                                        '(Final price will be shown after selecting location)',
                                        style: AppFonts.helperText.copyWith(
                                          fontSize: 11,
                                          color: AppColor.textGrey,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),

                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),

                        /// Added Services
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            'Added Services',
                            style: AppFonts.heading1.copyWith(fontSize: 18),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            children: addedServices.map((service) {
                              return ServiceItem(
                                title: service.title,
                                price: 'INR ${service.price.toInt()}',
                                isAdded: true,
                                showDelete: true,
                                onActionPressed: () =>
                                    _removeService(service.id),
                              );
                            }).toList(),
                          ),
                        ),

                        const SizedBox(height: 20),

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: SizedBox(
                            height: 50,
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () => _showAllAddOns(context),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColor.primaryPurple,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                elevation: 0,
                              ),
                              child: Text(
                                'View all',
                                style: AppFonts.bodyBold.copyWith(
                                  color: AppColor.primaryBackground,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 60),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          Positioned(
            bottom: 15,
            left: 25,
            right: 25,
            child: ContinuePriceButton(
              stepLabel: 'Next > Choose your location',
              priceTitle: 'Estimated price',
              priceValue: 'INR 2399',
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}
