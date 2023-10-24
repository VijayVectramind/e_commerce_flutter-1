import 'package:flutter/material.dart';

class PrimaryFilledButton extends StatefulWidget {
  /// [buttonTitle] is button text

  /// [widgetKey] is assigned to [FilledButton] so that it can used for automation

  final String buttonTitle;

  /// [buttonThemeStyle] is optional. if its not set i will access it from [filledButtonTheme] of [AppTheme.light] method
  // final FilledButtonThemeStyle? buttonThemeStyle;
  /// callback for button click
  final void Function()? onPressed;
  final bool isLoading;
  const PrimaryFilledButton({
    super.key,
    required this.buttonTitle,
    this.onPressed,

    // this.buttonThemeStyle,

    this.isLoading = false,
  });

  @override
  State<PrimaryFilledButton> createState() => _PrimaryFilledButtonState();
}

class _PrimaryFilledButtonState extends State<PrimaryFilledButton> {
  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      child: widget.isLoading
          ? const SizedBox(
              child: Center(child: CircularProgressIndicator()),
            )
          : FilledButton(
              onPressed: widget.onPressed,

              //             style: widget.buttonThemeStyle,

              child: Text(widget.buttonTitle, style: const TextStyle(
fontFamily: "Metropolis",
fontSize: 14,
fontWeight: FontWeight.w500,
color: Color(0xffFFFFFF),
height: 20/14,
),
textAlign: TextAlign.center,
),),

            );
    
  }
}
