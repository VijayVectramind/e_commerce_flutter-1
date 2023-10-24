import 'package:flutter/cupertino.dart';

class LoaderNotifierService extends ValueNotifier<bool> {
  LoaderNotifierService({bool? value}) : super(value ?? false);

  int count = 0;
  void toggle(bool newValue) {
    // Add your super logic here!
    value = newValue; 
  }

  increment() {
    count = count + 1;
    handleLoaderVisibility();
  }

  decrement() {
    count = count - 1;
    handleLoaderVisibility();
  }

  handleLoaderVisibility() {
    if (count == 0) {
      toggle(false);
    } else if (count == 1) {
      toggle(true);
    }
  }
}
