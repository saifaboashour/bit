class FullNameValidator {
  String? validateFirstLastName(String name) {
    if (name.isEmpty) {
      return 'Required Field!';
    }
    if (name.contains(' ') || name.indexOf(' ', 0) == name.length - 1) {
      return 'Full Name should be in this format John Doe';
    }
    return null;
  }
}
