

class ValidatorDef {
  static String? validatorEmail(val) {
    if (val == null || val.isEmpty) {
      return "Please enter your email";
    }
    if (!val.contains("@") || !val.contains(".")) {
      return "Please enter a valid email address";
    }
    return null;
  }

  static String? validatorPassword(val) {
    if (val == null || val.isEmpty) {
      return "Please enter your password";
    }
    return null;
  }

  static String? validatorname(val) {
    if (val == null || val.isEmpty) {
      return "Please enter your name";
    }
    return null;
  }
  static String? validatorAdress(val) {
    if (val == null || val.isEmpty) {
      return "Please select your address";
    }
    return null;
  }

  static String? validatorPhone(val) {
    if (val == null || val.isEmpty) {
      return "Please enter your phone number";
    }
    if ((val.toString()).length < 11) {
      return "Phone number must be at least 11 digits long";
    }
    return null;
  }
}
