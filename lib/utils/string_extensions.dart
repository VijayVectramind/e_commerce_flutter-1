import 'package:intl/intl.dart';

extension StringExtension on String {
  // this method attempts to parse string as time using dateformat class
  getTime() {
    try {
      // ("HH:mm:ss") 24 hour format
      // The parse(this) method tries to parse the current string instance (this) using the formatter and returns a DateTime object.
      DateTime dateTime = DateFormat("HH:mm:ss").parse(this);
      //The format(dateTime) method converts the DateTime object to a string representation in the desired format.
      return DateFormat("hh:mm a").format(dateTime);
    } catch (e) {
      e.toString();
    }
    return this;
  }

  // 190521541245
  String epochToDate() {
    try {
      int milliseconds = int.parse(this);
      DateTime date = DateTime.fromMillisecondsSinceEpoch(milliseconds);
      return DateFormat("yyyy-MM-dd hh:mm a").format(date);
    } catch (e) {
      e.toString();
    }
    return this;
  }

  // to convert 24 hrs DateTime to 12 hrs DateTime
  String militaryTimeToAMPM() {
    try {
      DateTime date = DateFormat("yyyy-MM-dd HH:mm:ss").parse(this);
      return DateFormat("yyyy-MM-dd hh:mm:ss a").format(date);
    } catch (e) {
      e.toString();
    }
    return this;
  }

  String appointmentRequestDateFormat() {
    try {
      DateTime date = DateFormat("yyyy-MM-dd HH:mm:ss").parse(this);
      return DateFormat("EEE, dd MMM yyyy - hh:mm a").format(date);
    } catch (e) {
      e.toString();
    }
    return this;
  }

  String getTimeFromDate() {
    try {
      DateTime date = DateFormat("yyyy-MM-dd HH:mm:ss").parse(this);
      return DateFormat("hh:mm a").format(date);
    } catch (e) {
      e.toString();
    }
    return this;
  }

  /*DateTime? epochToDateObject() {
    if (this.isNotEmpty) {
      try {
        DateTime parseDate = DateTime.fromMillisecondsSinceEpoch(int.parse(this));
        return parseDate;
      } catch (e) {}
    }
  }

  String epochToappointmentRequestDateFormat() {
    if (this.isNotEmpty) {
      try {
        DateTime parseDate = DateTime.fromMillisecondsSinceEpoch(int.parse(this));
        return DateFormat("EEE, dd MMM yyyy - hh:mm a").format(parseDate);
      } catch (e) {}
    }
    return "";
  }*/
}
