import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ErrorandExceptionDialog extends StatelessWidget {
  String message;
  ErrorandExceptionDialog({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
      child: Card(
          child: Container(
        padding: const EdgeInsets.all(8.0),
        width: double.infinity,
        child: Text(message, textAlign: TextAlign.start, style: GoogleFonts.poppins(fontSize: 12, color: Colors.black)),
      )),
    );
  }
}
