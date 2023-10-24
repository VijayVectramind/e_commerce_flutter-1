import 'package:flutter/material.dart';

// ignore_for_file: non_constant_identifier_names, constant_identifier_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final double height = WidgetsBinding.instance.window.physicalSize.height;
final double width = WidgetsBinding.instance.window.physicalSize.width;
//color
Color post_login_primary_color = const Color(0xFF243556);

Color heading_Text_Color = const Color(0xFF1F1A6D);
Color label_text__color = const Color(0xFFAAA8C3);
Color hint_text_color = const Color(0xFF67648F);
Color primary_color = const Color(0xFF6540FF);
Color white_color = const Color(0xFFFFFFFF);
Color post_login_bg_color = const Color(0xFFD8D8E5);

Color red_color = const Color(0xFFFA4747);
Color form_field_border_color = const Color(0xFFC0C7DC);
Color form_border_color = const Color(0xFFD7DFE2);
Color clear_border_color = const Color(0xFFAAA8C3);
Color light_blue_color = const Color(0xFFF8F9FF);
Color circle_card_background_color = const Color(0xFFF1EEFF);
Color line_bg_color = const Color(0xFFD2D9EC);
Color text_dark_black_color = const Color(0xFF35373A);
Color browse_button_border_color = const Color(0xFFCBCBCB);
Color browse_button_bg_color = const Color(0xFFE9E9F2);
Color browse_button_text_color = const Color(0xFF9A9BAC);
Color otp_form_field_border_color = const Color(0xFF727DA0);

//heading text font sizes
double _heading_text_font_size = 28;
double _post_login_heading_large_text_font_size = 26;

//label text font sizes

//hint text font sizes

//button font sizes
double font_size_fourteen = 14;
double font_size_ten = 10;
double font_size_eleven = 11;
double font_size_twelve = 12;
double font_size_thirteen = 13;
double font_size_fifteen = 15;
double font_size_sixteen = 16;
double font_size_seventeen = 17;
double font_size_eightteen = 18;
double font_size_nineteen = 19;
double font_sized_twenty = 20;
double _tappable_text_font_size = 14;
double _button_text_font_size = 18;

//error font size
double _error_font_size = 12.0;

//heading text styles
final TextStyle heading_text_style = GoogleFonts.poppins(textStyle: TextStyle(color: heading_Text_Color, fontSize: _heading_text_font_size, fontWeight: FontWeight.w700));

final TextStyle heading_post_login = GoogleFonts.poppins(textStyle: TextStyle(color: post_login_primary_color, fontSize: _post_login_heading_large_text_font_size, fontWeight: FontWeight.w600));

final TextStyle heading_medium_post_login = GoogleFonts.poppins(textStyle: TextStyle(color: post_login_primary_color, fontSize: font_size_eightteen, fontWeight: FontWeight.w600));

final TextStyle sub_heading_medium_post_login = GoogleFonts.poppins(textStyle: TextStyle(color: post_login_primary_color, fontSize: font_size_eightteen, fontWeight: FontWeight.w500));
final TextStyle sub_heading_small_post_login = GoogleFonts.poppins(textStyle: TextStyle(color: post_login_primary_color, fontSize: font_size_sixteen, fontWeight: FontWeight.w500));
final TextStyle heading_small_text_style = GoogleFonts.poppins(textStyle: TextStyle(color: heading_Text_Color, fontSize: font_size_fourteen, fontWeight: FontWeight.w400));
final TextStyle heading_small_black_color_text_style = GoogleFonts.poppins(textStyle: TextStyle(color: text_dark_black_color, fontSize: font_size_fourteen, fontWeight: FontWeight.w700));

final TextStyle medium_text_style_dark_color = GoogleFonts.poppins(textStyle: TextStyle(color: post_login_primary_color, fontSize: font_size_fourteen, fontWeight: FontWeight.w400));

final TextStyle medium_text_style = GoogleFonts.poppins(textStyle: TextStyle(color: post_login_primary_color, fontSize: font_size_sixteen, fontWeight: FontWeight.w600));

final TextStyle medium_text_style_light = GoogleFonts.poppins(textStyle: TextStyle(color: post_login_primary_color, fontSize: font_size_sixteen, fontWeight: FontWeight.w400));

final TextStyle small_text_style_light = GoogleFonts.poppins(textStyle: TextStyle(color: post_login_primary_color, fontSize: font_size_fourteen, fontWeight: FontWeight.w400));

//label text styles
final TextStyle label_text_style = GoogleFonts.poppins(textStyle: TextStyle(color: label_text__color, fontWeight: FontWeight.w400, fontSize: font_size_thirteen));

//hint text styles
final TextStyle hint_text_style = GoogleFonts.poppins(textStyle: TextStyle(color: hint_text_color, fontSize: font_size_sixteen, fontWeight: FontWeight.w500));

final TextStyle primary_text_style = GoogleFonts.poppins(textStyle: TextStyle(color: post_login_primary_color, fontSize: font_size_fourteen, fontWeight: FontWeight.w500));
//Text button text style
final TextStyle tappable_text_style =
    GoogleFonts.poppins(textStyle: TextStyle(color: hint_text_color, decoration: TextDecoration.underline, fontSize: _tappable_text_font_size, fontWeight: FontWeight.w400));

//button text style
final TextStyle button_text_style = GoogleFonts.poppins(textStyle: TextStyle(color: white_color, fontSize: _button_text_font_size, fontWeight: FontWeight.w600));
final TextStyle primary_button_text_style_small = GoogleFonts.poppins(textStyle: TextStyle(color: white_color, fontSize: font_size_twelve, fontWeight: FontWeight.w600));

final TextStyle primay_samll_text_style = GoogleFonts.poppins(textStyle: TextStyle(color: primary_color, fontSize: font_size_twelve, fontWeight: FontWeight.w600));

final TextStyle primary_button_text_style = GoogleFonts.poppins(textStyle: TextStyle(color: white_color, fontSize: font_size_fourteen, fontWeight: FontWeight.w600));

// Error text styles
final TextStyle error_text_style = GoogleFonts.poppins(textStyle: TextStyle(color: red_color, fontSize: _error_font_size, fontWeight: FontWeight.w400));

/// browse button style

final TextStyle browse_text_style = GoogleFonts.poppins(textStyle: TextStyle(color: browse_button_text_color, fontSize: font_size_fourteen, fontWeight: FontWeight.w400));

final TextStyle dark_small_text_style = GoogleFonts.poppins(textStyle: TextStyle(color: text_dark_black_color, fontSize: font_size_fourteen, fontWeight: FontWeight.w400));

//************************************** padding ratios *******************************/

double pre_login_form_side_paddings_ratio = 0.114;

//****************************************static heights and widths*******************/
double pre_login_field_to_field_larege_height_ratio = 0.034;
double pre_login_field_to_field_height_ratio = 0.024;
double static_height_min = 0.011;
//********************************************texts*****************************/

double getStaticHeight(double value) {
  return height * value;
}

double getStaticWidth(double value) {
  print('width ${width * value}');
  return width * value;
}

double getPaddingalongWidth(double value) {
  return width * value;
}

double getPaddingalongHeight(double value) {
  return height * value;
}

const String changeNo = "Change Number?";
const String viewText = "View";
const String newPasswordText = " New Password";
const String enterNewPasswordText = "Enter new password";
const String signupText = "Sign Up";


