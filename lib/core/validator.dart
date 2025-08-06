class Validator {
  //phoneNumber validation
  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone Number is required';
    }
    //regex for only numbers
    if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
      return 'Phone Number must be numbers';
    }

    if (value.length != 10 || !value.startsWith('05')) {
      return 'Phone Number must be 10 digits and starts with 05';
    }

    return null;
  }

  //validate password
  static String? validatePassword(String? value, {String? message}) {
    if (value?.trim().isEmpty ?? true) {
      return message ?? 'Password is required';
    } else if (!RegExp(
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&#])[A-Za-z\d@$!%*?&]{8,}$',
    ).hasMatch(value!)) {
      return message ??
          'Password must contain lowercase, uppercase, numbers, special characters and at least 8 characters';
    }
    return null;
  }

  //validate confirm password
  static String? validateConfirmPassword({String? value, String? password}) {
    if (value?.trim().isEmpty ?? true) {
      return 'Confirm Password is required';
    }
    if (value != password) {
      return 'Confirm Password must be the same as Password';
    }
    return null;
  }

  //validate email
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }

    if (!RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    ).hasMatch(value)) {
      return 'Invalid email address';
    }
    return null;
  }
}
