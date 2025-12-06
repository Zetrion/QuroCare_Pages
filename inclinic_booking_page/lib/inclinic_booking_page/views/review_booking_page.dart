import 'package:flutter/material.dart';
import '/core/app_colors.dart';
import '/core/app_fonts.dart';
import '../exports.dart';

class ReviewBookingPage extends StatefulWidget {
  const ReviewBookingPage({super.key});

  @override
  State<ReviewBookingPage> createState() => _ReviewBookingPageState();
}

class _ReviewBookingPageState extends State<ReviewBookingPage> {
  int selectedIndex = 1;
  final List<Map<String, String>> members = [
    {'name': 'SIMOY RAJAN', 'relation': 'Self', 'age': '21yr'},
    {'name': 'ABHISHEK JP', 'relation': 'Brother', 'age': '21yr'},
  ];

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    final padding = 16.0;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              padding: EdgeInsets.fromLTRB(padding, 12, padding, 140),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Top bar
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.of(context).maybePop(),
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(color: Colors.black12, blurRadius: 6),
                            ],
                          ),
                          child: const Icon(
                            Icons.arrow_back,
                            color: AppColor.primary,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        'Review Booking',
                        style: AppFonts.h6.copyWith(color: AppColor.textDark),
                      ),
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: AppColor.primaryDark,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Text(
                          'Slot : 04:00PM',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 18),
                  ClinicCard(),
                  const SizedBox(height: 18),

                  // I am booking for
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColor.cardBg,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(color: Colors.black12, blurRadius: 8),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'I am booking for',
                          style: AppFonts.title.copyWith(
                            color: AppColor.textDark,
                          ),
                        ),
                        const SizedBox(height: 12),
                        // list members
                        ...List.generate(members.length, (i) {
                          final m = members[i];
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: PatientCard(
                              name: m['name']!,
                              relation: m['relation']!,
                              age: m['age']!,
                              selected: i == selectedIndex,
                              onTap: () {
                                setState(() => selectedIndex = i);
                              },
                            ),
                          );
                        }),
                        const SizedBox(height: 6),

                        // add new
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton.icon(
                            icon: const Icon(Icons.add_circle_outline),
                            label: const Text('Add new Member'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColor.primary,
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              elevation: 6,
                            ),
                            onPressed: () => _openAddMemberSheet(context),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 16),

                  // More patient details (placeholder)
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: AppColor.cardBg,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(color: Colors.black12, blurRadius: 8),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'More Patient details (optional)',
                          style: AppFonts.title,
                        ),
                        const SizedBox(height: 8),
                        Text('Symptoms', style: AppFonts.bodyBold),
                        const SizedBox(height: 8),
                        Container(
                          height: 80,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: AppColor.lightGrey,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Text(
                            'Briefly describe symptoms or reason for visit',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                'upload past reports(if any)',
                                style: AppFonts.body,
                              ),
                            ),
                            Switch(value: true, onChanged: (_) {}),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: 36,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColor.lightGrey,
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Row(
                                  children: [
                                    const Expanded(
                                      child: Text('Prescriptions'),
                                    ),
                                    const Icon(Icons.upload_file, size: 18),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Container(
                                height: 36,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColor.lightGrey,
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Row(
                                  children: [
                                    const Expanded(child: Text('Scan/X-ray')),
                                    const Icon(Icons.upload_file, size: 18),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 120),
                ],
              ),
            ),

            // Confirm bar floating near bottom
            /*Align(
              alignment: Alignment.bottomCenter,
              child: ConfirmBar(
                amountText: '₹ 90/-',
                onConfirm: () {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(const SnackBar(content: Text('Confirmed')));
                },
              ),
            ),*/
          ],
        ),
      ),
    );
  }

  void _openAddMemberSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) => AddMemberSheet(
        onSave: (member) {
          setState(() {
            members.add(member);
            selectedIndex = members.length - 1;
          });
        },
      ),
    );
  }
}
