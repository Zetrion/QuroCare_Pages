import 'package:intl/intl.dart';
import 'package:inclinic_appointment_page/Inclinic_appointment_page/models/appointment_slot.dart';

class AppointmentService {
  Future<List<DateSlot>> getAvailableDates() async {
    await Future.delayed(const Duration(milliseconds: 500));
    final now = DateTime.now();
    final daysOfWeek = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    List<DateSlot> slots = [];
    for (int i = 0; i < 6; i++) {
      final date = now.add(Duration(days: i));
      final dayName = daysOfWeek[date.weekday - 1];
      final dateStr = DateFormat('d MMM').format(date);
      slots.add(DateSlot(day: dayName, date: dateStr));
    }
    return slots;
  }

  Future<List<TimeSlot>> getAvailableTimeSlots(DateSlot date) async {
    await Future.delayed(const Duration(milliseconds: 500));
    return [
      TimeSlot(time: "09:00 AM"),
      TimeSlot(time: "09:30 AM"),
      TimeSlot(time: "10:00 AM"),
      TimeSlot(time: "10:30 AM"),
      TimeSlot(time: "11:00 AM"),
      TimeSlot(time: "11:30 AM"),
      TimeSlot(time: "12:00 PM"),
      TimeSlot(time: "12:30 PM"),
      TimeSlot(time: "01:00 PM"),
    ];
  }

  
}