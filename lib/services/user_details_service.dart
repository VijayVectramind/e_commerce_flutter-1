// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:fp_mobile_app/model/existing_patient/existing_patinet_response_model.dart';
// import 'package:fp_mobile_app/model/login/login_response_model.dart';
// import 'package:fp_mobile_app/utils/enums.dart';
// import 'package:flutter/foundation.dart' show kIsWeb;
// import '../model/mymenu.dart';
// import '../model/profile/profile_parent_profile_response_model.dart';

// class UserService {
//   String _token = '';
//   int _userId = 0;
//   int _patientId = 0;
//   int _enterPriseId = 0;
//   UserDetails? _userDetails;
//   KycGetDto? _userProfile;
//   List<Menu> _menus = [];
//   LayoutTypeEnum _layoutType = LayoutTypeEnum.MOBILE_LAYOUT;
//   dynamic _journeyStaticDataModel;
//   dynamic _serviceStatusJouney;

//   setLayoutTemplate(BuildContext context) {
//     final data = MediaQueryData.fromWindow(WidgetsBinding.instance.window);
//     if (kIsWeb) {
//       if (data.size.width > 600) {
//         layoutType = LayoutTypeEnum.WEB_LAYOUT;
//       } else {
//         layoutType = LayoutTypeEnum.MOBILE_LAYOUT;
//       }
//     } else {
//       if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
//         layoutType = LayoutTypeEnum.WEB_LAYOUT;
//       } else if (Platform.isAndroid || Platform.isIOS) {
//         if (data.size.shortestSide > 600) {
//           if (MediaQuery.of(context).orientation == Orientation.landscape) {
//             layoutType = LayoutTypeEnum.TAB_LANDSCAPE_LAYOUT;
//           } else {
//             layoutType = LayoutTypeEnum.TAB_POTRAIT_LAYOUT;
//           }
//         } else {
//           layoutType = LayoutTypeEnum.MOBILE_LAYOUT;
//         }
//       }
//     }
//   }

//   set journeyStaticDataModel(dynamic value) => _journeyStaticDataModel = value;
//   set serviceStatusJouney(dynamic value) => _serviceStatusJouney = value;
//   set layoutType(LayoutTypeEnum value) => _layoutType = value;
//   set menus(List<Menu> value) => _menus = [...value];
//   set userProfile(KycGetDto? value) => _userProfile = value;
//   set token(String value) => _token = value;
//   set userId(int value) => _userId = value;
//   set userDetails(UserDetails? value) {
//     _userDetails = value;
//     _userId = value != null ? value.userId : 0;
//     _patientId = value != null ? value.userId : 0;
//     _enterPriseId = value != null ? value.userId : 0;
//   }

//   dynamic get journeyStaticDataModel => _journeyStaticDataModel;
//   dynamic get serviceStatusJouney => _serviceStatusJouney;
//   LayoutTypeEnum get layoutType => _layoutType;
//   List<Menu> get menus => _menus;
//   UserDetails? get userDetails => _userDetails;
//   String get token => _token;
//   KycGetDto? get userProfile => _userProfile;
//   int get userId => _userId;
//   int get patinetId => _patientId;
//   int get enterPriseId => _enterPriseId;

//   reset() {
//     _token = '';
//     _userDetails = null;
//     _userProfile = null;
//     _menus = [];
//     _userId = 0;
//     _patientId = 0;
//     _enterPriseId = 0;
//   }
// }
