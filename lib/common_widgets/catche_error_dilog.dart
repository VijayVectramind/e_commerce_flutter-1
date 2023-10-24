
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

import '../utils/styles.dart';

class CatcheErrorDialog {
  static showError(e) {
    SmartDialog.show(
      backDismiss: false,
      builder: (_) {
        return Card(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            constraints: const BoxConstraints(
              minWidth: 300,
            ),
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(e.toString(), style: erroeTextStyle),
              SizedBox(height: 30,),
                SizedBox(
                  width: 100,
                  child: PrimaryFilledButton(
                     buttonTitle:"OK" ,
                     isLoading: false,
                      onPressed: () {
                        SmartDialog.dismiss();
                      }),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
