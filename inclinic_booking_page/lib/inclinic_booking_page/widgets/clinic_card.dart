import 'package:flutter/material.dart';
import '/core/app_colors.dart';
import '/core/app_fonts.dart';

class ClinicCard extends StatelessWidget {
  const ClinicCard({super.key});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppColor.gradientStart, AppColor.gradientEnd],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // top row - title + image
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Qurocare Clinics',
                      style: AppFonts.h6.copyWith(color: Colors.white),
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.yellow, size: 16),
                        const Icon(Icons.star, color: Colors.yellow, size: 16),
                        const Icon(Icons.star, color: Colors.yellow, size: 16),
                        const Icon(
                          Icons.star_half,
                          color: Colors.yellow,
                          size: 16,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Ulloor, Trivandrum',
                          style: AppFonts.body.copyWith(color: Colors.white70),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                width: w * 0.22,
                height: w * 0.14,
                decoration: BoxDecoration(
                  color: Colors.white24,
                  borderRadius: BorderRadius.circular(8),
                  image: const DecorationImage(
                    image: AssetImage('assets/clinic_placeholder.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),
          Container(height: 1, color: Colors.white24),
          const SizedBox(height: 12),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _timeColumn('Start Time', '29 Sep 2025,Sat\n04:00PM'),
              Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white24,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Consultation',
                          style: AppFonts.caption.copyWith(
                            color: Colors.white70,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '00:30 minutes',
                          style: AppFonts.body.copyWith(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              _timeColumn('End Time', '29 Sep 2025,Sat\n04:30PM'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _timeColumn(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppFonts.body.copyWith(color: Colors.white70)),
        const SizedBox(height: 6),
        Text(
          value,
          style: AppFonts.body.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
