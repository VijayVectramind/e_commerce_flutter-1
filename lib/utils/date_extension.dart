// import 'package:intl/intl.dart';

// extension DateExtension on DateTime {
//   String appointmentRequestDateFormat() {
//     try {
//       return DateFormat("EEE, dd MMM yyyy - hh:mm a").format(this);
//     } catch (e) {
//       e.toString();
//     }
//     return "";
//   }
// }

import 'package:intl/intl.dart';

extension DateExtension on DateTime {
  String appointmentRequestDateFormat() {
    try {
      DateTime now = DateTime.now();

      if (this.year == now.year && this.month == now.month && this.day == now.day) {
        // Display only time for today's date
        return DateFormat("hh:mm a").format(this);
      } else {
        // Display full date and time for previous dates
        return DateFormat("EEE, dd MMM yyyy - hh:mm a").format(this);
      }
    } catch (e) {
      return e.toString();
    }
  }
}
