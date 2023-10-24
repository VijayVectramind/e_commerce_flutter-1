import 'dart:developer';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../network/exceptions.dart';
import 'dart:ui' as ui show Image;
import 'enums.dart';

/////////////////////// Go Router navigate Route ///////////////////


navigate(
    {required NavigationEnum navigationEnum,
    String? route,
    required BuildContext context,
    dynamic extra,
    dynamic queryParams,
    dynamic pathParams,
    dynamic popvalue}) {
  switch (navigationEnum) {
    case NavigationEnum.GO:
      return Router.neglect(context, () {
        context.goNamed(route!,
            extra: extra,
            pathParameters: pathParams ?? {},
            queryParameters: queryParams ?? {});
      });

    case NavigationEnum.PUSH:
      return GoRouter.of(context).pushNamed(route!,
          extra: extra,
          pathParameters: pathParams ?? {},
          queryParameters: queryParams ?? {});

    case NavigationEnum.REPLACE:
      return GoRouter.of(context).pushReplacementNamed(route!,
          extra: extra,
          pathParameters: pathParams ?? {},
          queryParameters: queryParams ?? {});

    case NavigationEnum.PUSHCALLBACK:
      return Router.neglect(context, () {
        GoRouter.of(context)
            .pushNamed(route!,
                extra: extra,
                pathParameters: pathParams ?? {},
                queryParameters: queryParams ?? {})
            .then((value) => null);
      });

    case NavigationEnum.POP:
      return Router.neglect(context, () {
        popvalue != null ? context.pop(popvalue) : context.pop();
      });
  }
}
// Future<Uint8List> compressImage(Uint8List image, double previousSize) async {
//   //ui.Image data = await decodeImageFromList(image);

//   int imageQuality = 30;
//   if (previousSize > 4000) {
//     imageQuality = 20;
//   } else if (previousSize.clamp(2000, 4000) == previousSize) {
//     imageQuality = 25;
//   } else if (previousSize.clamp(2000, 4000) == previousSize) {
//     imageQuality = 30;
//   } else {
//     imageQuality = 60;
//   }

//   return await FlutterImageCompress.compressWithList(image,
//       quality: imageQuality);
// }

/////////////////////// To Choose File ///////////////////
Future<XFile?> pickImage(ImageSource media) async {
  XFile? image = await ImagePicker().pickImage(source: media);
  if (image != null) {
    int length = await image.length();
    final kb = length / 1024;

    if (kb > 245) {
      // throw ImageSizeException("Image Size should be less than 245 KB");
      Uint8List imageBytes = await image.readAsBytes();
      Uint8List compressedImage = await compressImage(imageBytes, kb);
      final compressedImageLength = compressedImage.length / 1024;
      log("compressedImageLength ${compressedImageLength} ${image.name},");
      if (compressedImageLength > 245) {
        throw ImageSizeException("Image Size should be less than 245 KB");
      } else {
        DateTime now = DateTime.now();
        String imageName = DateFormat("ddMMyyyy_HH_mm_ss").format(now);
        return XFile.fromData(compressedImage,
            name: image.name, path: "$imageName.jpg");
      }
    }

    return image;
  }
}

Future<Uint8List> compressImage(Uint8List image, double previousSize) async {
  //ui.Image data = await decodeImageFromList(image);

  int imageQuality = 30;
  if (previousSize > 4000) {
    imageQuality = 20;
  } else if (previousSize.clamp(2000, 4000) == previousSize) {
    imageQuality = 25;
  } else if (previousSize.clamp(2000, 4000) == previousSize) {
    imageQuality = 30;
  } else {
    imageQuality = 60;
  }

  return await FlutterImageCompress.compressWithList(image,
      quality: imageQuality);
}

// Future<XFile?> pickImageWeb(BuildContext context) async {
//   XFile? image = await CustomPlatForm().captureImage(context);
//   if (image != null) {
//     int length = await image.length();
//     final kb = length / 1024;
//     if (kb > 245) {
//       throw ImageSizeException("Image Size should be less than 245 KB");
//     }
//   }
//   return image;
// }

String calculateAge(DateTime birthDate) {
  DateTime currentDate = DateTime.now();
  int age = currentDate.year - birthDate.year;
  int month1 = currentDate.month;
  int month2 = birthDate.month;
  if (month2 > month1) {
    age--;
  } else if (month1 == month2) {
    int day1 = currentDate.day;
    int day2 = birthDate.day;
    if (day2 > day1) {
      age--;
    }
  }
  return age.toString();
}

bool checkDateisToday(String appointmentTime) {
  final currentDate = DateTime.now();
  final today = DateTime(currentDate.year, currentDate.month, currentDate.day);

  final dateToCheck = DateFormat("yyyy-MM-dd HH:mm:ss").parse(appointmentTime);
  final aDate = DateTime(dateToCheck.year, dateToCheck.month, dateToCheck.day);
  if (aDate == today) {
    return true;
  }
  return false;
}

// bool checkDateisToday(int appointmentTime) {
//   final currentDate = DateTime.now();
//   final today = DateTime(currentDate.year, currentDate.month, currentDate.day);
//   final dateToCheck = DateTime.fromMillisecondsSinceEpoch(appointmentTime);
//   final aDate = DateTime(dateToCheck.year, dateToCheck.month, dateToCheck.day);
//   if (aDate == today) {
//     return true;
//   }
//   return false;
// }

/* DateTime? epochToDate(int? time) {
  if (time != null) {
    return DateTime.fromMillisecondsSinceEpoch(time);
  }
} */

/* String? toAppointmentDateFormat(int? time) {
  try {
    if (time != null) {
      DateTime? appointmentTime = epochToDate(time);
      return DateFormat("EEE, dd MMM yyyy - hh:mm a").format(appointmentTime!);
    }
  } catch (e) {}
  return "";
} */

// String getDeviceType() {
//   final data = MediaQueryData.fromWindow(WidgetsBinding.instance.window);
//   return data.size.shortestSide < 600 ? MOBILE : TABLET;
// }

InputDecoration getDropdownInputDecoration() {
  return InputDecoration(
    enabledBorder: InputBorder.none,
    isDense: true,
    contentPadding: EdgeInsets.zero,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide.none,
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide.none,
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide.none,
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide.none,
    ),
    errorStyle: GoogleFonts.poppins(
        color: const Color(0xffFE381D),
        fontSize: 14,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(
        15,
      ),
      borderSide: BorderSide.none,
    ),
  );
}

ButtonStyleData getDropdownButtonStyle() {
  return ButtonStyleData(
    height: 50,
    width: double.infinity,
    padding: const EdgeInsets.only(left: 14, right: 14),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      color: const Color(0xffF5F6FA),
    ),
  );
}

IconStyleData getDropdownIconStyle() {
  return const IconStyleData(
    icon: Icon(Icons.keyboard_arrow_down_outlined),
    iconSize: 30,
  );
}

DropdownStyleData getDropdownStyle() {
  return DropdownStyleData(
    maxHeight: 150,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
    ),
  );
}

MenuItemStyleData getDropDownMenuStyle() {
  return MenuItemStyleData(
    height: 40,
    padding: EdgeInsets.only(left: 14, right: 14),
  );
}

final ErrorStrings errorStrings = ErrorStrings();

class ErrorStrings {
  final String error_message_field_required = 'This field is required';
  final String error_message_valid_email_id =
      'Please enter some valid email id';
  //password
  final String error_message_password_min_characters =
      'Minimum 6 characers of length';
  final String error_message_password_max_characters =
      'Maxmimum 10 characers of length';
  final String error_message_valid_password =
      'Please enter password which containes at least One capital, one Small ,One Special Character,one Number';
}