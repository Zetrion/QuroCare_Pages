import 'package:flutter/material.dart';
import 'package:inclinic_appointment_page/Inclinic_appointment_page/clinic_export.dart';
import 'package:inclinic_appointment_page/core/constants/app_colors.dart';

class ClinicAppointmentPage extends StatefulWidget {
  const ClinicAppointmentPage({Key? key}) : super(key: key);

  @override
  State<ClinicAppointmentPage> createState() => _ClinicAppointmentPageState();
}

class _ClinicAppointmentPageState extends State<ClinicAppointmentPage> {
  int selectedDateIndex = -1;
  String? selectedPeriod;
  String? selectedTime;

  List<DateSlot> dates = [];
  List<TimeSlot> times = [];

  final List<String> periods = ["Morning", "Afternoon", "Evening"];
  final AppointmentService _service = AppointmentService();

  @override
  void initState() {
    super.initState();
    _initializeData();
  }

  Future<void> _initializeData() async {
    await _loadDates();
    await _loadTimes();
  }

  Future<void> _loadDates() async {
    dates = await _service.getAvailableDates();
    setState(() {});
  }

  Future<void> _loadTimes() async {
    if (dates.isEmpty) return;
    final dateSlot = selectedDateIndex >= 0
        ? dates[selectedDateIndex]
        : dates.first;
    times = await _service.getAvailableTimeSlots(dateSlot);
    setState(() {});
  }

  bool get _canContinue =>
      selectedDateIndex >= 0 && selectedPeriod != null && selectedTime != null;

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;
    final paddingH = screen.width * 0.07;
    final paddingV = screen.height * 0.02;
    const double bottomBarHeight =
        92; // reserve this much space for legend/continue button

    return Scaffold(
      appBar: AppBar(
        title: const Text("Clinic Appointment"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.calendar_today),
          ),
        ],
        backgroundColor: AppColors.primary,
      ),
      body: SafeArea(
        child: Stack(
          children: [
            // reserve bottom space so column contents don't get overlapped by the Positioned bottom bar
            Padding(
              padding: const EdgeInsets.only(bottom: bottomBarHeight),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Date Selector
                  DateSelector(
                    dates: dates,
                    selectedIndex: selectedDateIndex,
                    onDateSelected: (index) {
                      setState(() {
                        selectedDateIndex = index;
                        selectedTime = null;
                      });
                      _loadTimes();
                    },
                  ),

                  const Divider(height: 1, color: Colors.white, thickness: 2),

                  // Period Selector
                  PeriodSelector(
                    periods: periods,
                    selectedPeriod: selectedPeriod ?? '',
                    onPeriodSelected: (period) {
                      setState(() => selectedPeriod = period);
                    },
                  ),

                  // Time Slots
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: paddingV * 2,
                        horizontal: paddingH,
                      ),
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          final gridHeight = constraints.maxHeight * 0.7;
                          return SizedBox(
                            height: gridHeight,
                            child: TimeSlotGrid(
                              times:
                                  times, 
                              selectedTime: selectedTime,
                              onTimeSelected: (time) {
                                setState(() => selectedTime = time);
                              },
                            ),
                          );
                        },
                      ),
                    ),
                  ),

                  // Slot Count Info Row
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: paddingH,
                      vertical: paddingV,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const _Dot(color: AppColors.primary),
                        SizedBox(width: screen.width * 0.02),
                        const Text(
                          "Total Slots : 25",
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(width: screen.width * 0.06),
                        const _Dot(color: Colors.green),
                        SizedBox(width: screen.width * 0.02),
                        const Text(
                          "Available Slots : 20",
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Bottom Section
            Positioned(
              // give Positioned a fixed height that matches the reserved padding
              bottom: 0,
              left: 0,
              right: 0,
              height: bottomBarHeight,
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 350),
                transitionBuilder: (child, anim) => FadeTransition(
                  opacity: anim,
                  child: SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(0, 0.3),
                      end: Offset.zero,
                    ).animate(anim),
                    child: child,
                  ),
                ),
                child: _canContinue
                    ? ContinueButtonSection(
                        key: const ValueKey('continue'),
                        selectedDate: selectedDateIndex >= 0
                            ? dates[selectedDateIndex]
                            : null,
                        selectedPeriod: selectedPeriod,
                        selectedTime: selectedTime,
                      )
                    : Container(
                        key: const ValueKey('legend'),
                        padding: EdgeInsets.symmetric(
                          horizontal: paddingH,
                          vertical: paddingV,
                        ),
                        color: Colors.transparent,
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              LegendItem(
                                color: Colors.transparent,
                                borderColor: AppColors.primary,
                                text: "Availability",
                                textColor: Colors.black,
                              ),
                              SizedBox(width: screen.width * 0.06),
                              LegendItem(
                                color: AppColors.primary,
                                text: "Selected",
                                textColor: Colors.black,
                              ),
                              SizedBox(width: screen.width * 0.06),
                              LegendItem(
                                color: Colors.grey,
                                text: "Sold",
                                textColor: Colors.black,
                              ),
                            ],
                          ),
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final Color color;
  const _Dot({required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 14,
      height: 14,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
}
