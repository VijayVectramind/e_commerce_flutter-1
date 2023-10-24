String? emailValidator(email) {
  if (email.isEmpty) {
    return "Please enter the email id";
  }
  String p = "[a-zA-Z0-9.]{1,256}\\@[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}(\\.[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25})+";
  RegExp regExp = RegExp(p);
  if (!regExp.hasMatch(email)) {
    return 'Email Id is not valid';
  }
  return null;
}

String? phoneNoValidator(value) {
  if (value.isEmpty) {
    return "Please enter the Mobile number";
  }
  String p = "^([6-9]{1})([0-9]{9})\$";
  RegExp regExp = RegExp(p);
  if (!regExp.hasMatch(value)) {
    return 'Please enter valid Mobile number';
  }
  return null;
}

String relationValidator(str) {
  if (str == null) {
    return "Select relation";
  }
  return "";
}

String? validator(value) {
  if (value!.isEmpty) {
    return 'Please enter the valid data';
  }
  return null;
}

String? emailOrMobileNumberValidator(value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your email or phone number';
  }
  final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  final phoneRegExp = RegExp(r'^\d{9,15}$');
  if (!(emailRegExp.hasMatch(value) || phoneRegExp.hasMatch(value))) {
    return 'Please enter a valid email or phone number';
  }
  return null;
}

String? dateValidator(value) {
  if (value == null) {
    return "Please select the date";
  }
  return null;
}

String? mobNoValidator(value) {
  if (value == null || value.isEmpty) {
    return "Please enter the Mobile number";
  }
  if (value.length < 9) {
    return "Mobile number should be atleast 9 character";
  }
  if (value.length > 15) {
    return "Moible number should not exceed 15 character";
  }
  return null;
}

String? nameValidator(value) {
  if (value!.isEmpty) {
    return 'Please enter your name';
  }
  return null;
}

String? policyNoValidator(value) {
  if (value!.isEmpty) {
    return 'Please enter your Insurance Policy / Card Number';
  }
  return null;
}

String? emIdValidator(value) {
  if (value!.isEmpty) {
    return 'Please enter the Correct Emirates Id';
  }
  return null;
}

String? insuranceProviderValidator(value) {
  if (value!.isEmpty) {
    return 'Please enter Insurance provider name';
  }
  return null;
}

String? passwordvalidator(value) {
  if (value!.isEmpty) {
    return 'Please enter  password';
  }
  return null;
}

String? timeSlotValidator(value) {
  if (value == null) {
    return "Please select the Time Slot";
  }
  return null;
}

String? passwordValidator(value) {
  bool isValidPassword = isPasswordCompliant(value!);
  if (!isValidPassword) {
    return "Please enter the Valid Password";
  }

  return null;
}

bool isPasswordCompliant(String password, [int minLength = 8]) {
  if (password.length < minLength) {
    return false;
  }

  bool hasUppercase = password.contains(RegExp(r'[A-Z]'));
  if (hasUppercase) {
    bool hasDigits = password.contains(RegExp(r'[0-9]'));
    if (hasDigits) {
      bool hasLowercase = password.contains(RegExp(r'[a-z]'));
      if (hasLowercase) {
        bool hasSpecialCharacters = password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
        return hasSpecialCharacters;
      }
    }
  }
  return false;
}


class AppValidators {
  static String? validateMobile(value, {bool allowEmpty = false}) {
    const String kEmptyValidator = "Phone Number can't be empty.";

    const String kValidValidator = "Phone Number is invalid.";

    if (value == null || value.isEmpty && !allowEmpty) {
      return kEmptyValidator;
    }

    if ((value == null || value.isEmpty) && allowEmpty) {
      return null;
    }

    String pattern = r"^[6-9]\d{9}$";

    RegExp regExp = RegExp(pattern);

    if (!regExp.hasMatch(value)) {
      return kValidValidator;
    }

    return null;
  }

  static String? validateChips(value) {
    if (value == null) {
      return "Field is required";
    }

    return null;
  }

  static String? validateEmail(value, {bool allowEmpty = false}) {
    const String kEmptyValidator = "Email can't be empty.";

    const String kValidValidator = "Email is invalid.";

    if (value == null || value.isEmpty && !allowEmpty) {
      return kEmptyValidator;
    }

    if ((value == null || value.isEmpty) && allowEmpty) {
      return null;
    }

    String pattern =
        r"^([a-zA-Z0-9_\-\.\+]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$";

    RegExp regExp = RegExp(pattern);

    if (!regExp.hasMatch(value)) {
      return kValidValidator;
    }

    return null;
  }

  static String? validateOTP(value) {
    const String kEmptyValidator = "Enter Valid OTP.";

    const String kValidValidator = "OTP must be of 6 digit.";

    if (value == null || value.isEmpty) {
      return kEmptyValidator;
    }

    String pattern = r"^\d{6}$";

    RegExp regExp = RegExp(pattern);

    if (!regExp.hasMatch(value)) {
      return kValidValidator;
    }

    return null;
  }

  static String? validateNumeric(value) {
    const String kEmptyValidator = "Enter Valid No";

    if (value == null || value.isEmpty) {
      return kEmptyValidator;
    }

    String pattern = r"^[0-9]+$";

    RegExp regExp = RegExp(pattern);

    if (!regExp.hasMatch(value)) {
      return kEmptyValidator;
    }

    return null;
  }

  static String? requiredDropdown(value) {
    const String kEmptyValidator = "This field is required.";

    if (value == null) {
      return kEmptyValidator;
    }

    return null;
  }

  static String? requiredFiled(value) {
    const String kEmptyValidator = "This field is required.";

    if (value == null || value.isEmpty) {
      return kEmptyValidator;
    }

    return null;
  }

  static String? validateDescription(String? value) {
    const String kValidValidator = "Enter valid description";

    if (value == null ||
        value.contains('<') ||
        value.contains('>') ||
        value.isEmpty) {
      return kValidValidator;
    }

    return null;
  }
}

//Regexs
final RegExp emailRegExp = RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
final RegExp passwordRegExp =
    RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]+$');




