class PasswordValidator {
  String? validatePasswordStrength(String password) {
    RegExp regExp = RegExp(
        r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$');
    if (password.isEmpty) {
      return 'Required Field!';
    }
    if (!regExp.hasMatch(password)) {
      return 'Poor Password!';
    }
    return null;
  }

  String? validateConfirmPassword(String password, String confirmPassword) {
    if (confirmPassword.isEmpty) {
      return 'Required Field!';
    }
    if (confirmPassword != password) {
      return 'Password Mismatch!';
    }
    return null;
  }
}
