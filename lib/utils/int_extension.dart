import 'package:intl/intl.dart';

extension intExtension on int {
  //convert int value to datetime object
  DateTime epochToDate() {
    return DateTime.fromMillisecondsSinceEpoch(this);
  }

  String? toAppointmentDateFormat() {
    try {
      DateTime? appointmentTime = DateTime.fromMillisecondsSinceEpoch(this);
      return DateFormat("EEE, dd MMM yyyy - hh:mm a").format(appointmentTime!);
    } catch (e) {}
    return "";
  }
}
