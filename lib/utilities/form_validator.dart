class FieldValidator {
  static String validateEmail(String value) {
    if (value.isEmpty) return 'Email can\'t be empty.';

    Pattern pattern =
        r'^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$';
    RegExp regex = RegExp(pattern);

    if (!regex.hasMatch(value)) {
      return 'Invalid email.';
    }

    return null;
  }

  static String validatePassword(String value) {
    if (value.isEmpty) return 'Password can\'t be empty.';

    if (value.length < 8) {
      return 'Password must have at least 8 characters.';
    }

    return null;
  }
}
