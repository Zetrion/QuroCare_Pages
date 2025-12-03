import 'package:flutter/material.dart';
import '../../core/app_colors.dart';
import '../../core/app_fonts.dart';
import 'package:home_booking_pages/home_booking_page/exports.dart';

class ReviewBookingView extends StatefulWidget {
  const ReviewBookingView({Key? key}) : super(key: key);

  @override
  State<ReviewBookingView> createState() => _ReviewBookingViewState();
}

class _ReviewBookingViewState extends State<ReviewBookingView> {
  bool isAgreementChecked = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColor.background,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColor.primary,
        foregroundColor: AppColor.background,
        title: Text(
          'Review Booking',
          style: AppFonts.bodyBold.copyWith(
            fontSize: 24,
            color: AppColor.background,
          ),
          maxLines: 1, // prevent overflow
          overflow: TextOverflow.ellipsis, // prevent overflow
        ),
        centerTitle: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 18),
          onPressed: () => Navigator.of(context).maybePop(),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: FittedBox(
              // ensure the chip scales down instead of causing overflow
              fit: BoxFit.scaleDown,
              child: const SlotChipWidget(slotTime: '04:00PM'),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(
              16,
              16,
              16,
              size.height * 0.14, // space for fixed button
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const ReviewHeader(), // address card
                const SizedBox(height: 16),
                const HomeDoctorCard(),
                const SizedBox(height: 16),
                const BookingForWidget(),
                const SizedBox(height: 16),
                const MorePatientDetailsWidget(),
                const SizedBox(height: 16),
                const PriceBreakdownWidget(),
                const SizedBox(height: 16),
                const CouponCodesWidget(),
                const SizedBox(height: 16),
                UserAgreementWidget(
                  value: isAgreementChecked,
                  onChanged: (v) {
                    setState(() => isAgreementChecked = v);
                  },
                ),
              ],
            ),
          ),
          /**Align(
            alignment: Alignment.bottomCenter,
            child: SafeArea(
              minimum: const EdgeInsets.fromLTRB(16, 0, 16, 12),
              child: BottomConfirmBar(
                amountText: '₹ 90/-',
                label: 'To pay at the clinic',
                buttonText: 'Confirm',
                isEnabled: isAgreementChecked,
                onPressed: isAgreementChecked ? () {} : null,
              ),
            ),
          ),*/
        ],
      ),
    );
  }
}
