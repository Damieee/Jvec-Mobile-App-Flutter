import 'package:get/utils.dart';

class Validator {
  static String? isAccountNumber(String? value) {
    if (value?.isEmpty ?? true) {
      return 'This field is required';
    } else if (value!.length != 10) {
      return 'This must be 10 digit long';
    }
    return null;
  }

  static String? isName(String? value) {
    String patttern =
        r"^([a-zA-Z]{2,}\s[a-zA-z]{1,}'?-?[a-zA-Z]{2,}\s?([a-zA-Z]{1,})?)";
    RegExp regExp = new RegExp(patttern);
    if (value?.isEmpty ?? true) {
      return 'This field is required';
    }
    return null;
  }

  static String? isEmail(String? value) {
    if (value?.isEmpty ?? true) {
      return 'This field is required';
    } else if (!GetUtils.isEmail(value!.trim())) {
      return 'Please enter a valid email';
    }
    return null;
  }

  static String? isPhone(String? value) {
    if (value?.isEmpty ?? true) {
      return 'This field is required';
    } else if (!GetUtils.isNumericOnly(value!.trim()) ||
        !GetUtils.isLengthEqualTo(value.trim(), 11)) {
      return 'Please enter a valid phone number';
    }
    return null;
  }

  static String? isReferrerCode(String? value) {
    if (value?.isEmpty ?? true) {
      return 'This field is required';
    } else if (!GetUtils.isNumericOnly(value!.trim()) ||
        !GetUtils.isLengthEqualTo(value.trim(), 11)) {
      return '';
    }
    return null;
  }

  static String? isPassword(String? value) {
    if (value?.isEmpty ?? true) {
      return 'This field is required';
    } else if (!GetUtils.isLengthGreaterOrEqual(value, 4)) {
      return 'Password must be 4 characters long';
    }
    return null;
  }

  static String? isOldPassword(String? value) {
    if (value?.isEmpty ?? true) {
      return 'This field is required';
    } else if (!GetUtils.isLengthGreaterOrEqual(value, 6)) {
      return 'Password must be at least 6 characters long';
    }
    return null;
  }

  static String? isNewPassword(String? value) {
    if (value?.isEmpty ?? true) {
      return 'This field is required';
    } else if (!GetUtils.isLengthGreaterOrEqual(value, 6)) {
      return 'Password must be at least 6 characters long';
    }
    return null;
  }

  static String? isConfirmPassword(String? value) {
    if (value?.isEmpty ?? true) {
      return 'This field is required';
    } else if (!GetUtils.isLengthGreaterOrEqual(value, 6)) {
      return 'Password must be at least 6 characters long';
    }
    return null;
  }

  static String? isAddress(String value) {
    if (value.isEmpty) {
      return 'This field is required';
    } else if (!GetUtils.isLengthGreaterThan(value, 4)) {
      return 'Please enter a valid Address';
    }
    return null;
  }

  static String? isNotEmpty(String? value) {
    if (GetUtils.isNullOrBlank(value)!) {
      return 'This field is required';
    }
    return null;
  }

  static String? isOptional(String? value) {
    if (!GetUtils.isBlank(value)! && value!.length != 7) {
      return 'RC Number must be seven digit long';
    }
    return null;
  }

  static String? isInviteCode(String value) {
    if (value.isNotEmpty && value.length != 6) {
      return 'Invite code must be six characters long';
    }
    return null;
  }

  static String? isPromoCode(String value) {
    if (value.isEmpty || value.length != 6) {
      return 'Promo code must be six characters long';
    }
    return null;
  }

  static String? isPinCode(String value) {
    if (value.isEmpty || value.length != 4) {
      return 'Withdrawal pin must be four characters long';
    }
    return null;
  }
}
