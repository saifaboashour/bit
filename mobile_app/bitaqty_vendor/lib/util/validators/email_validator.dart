class EmailValidator {
  String? validateEmailFormat(String email) {
    RegExp regExp = RegExp(
        r'^(\w|\")?[\w]+(\.|\"|\-|\+)?[\w]+(\w|\")?@(\[[\d]{0,3}\.[\d]{0,3}\.[\d]{0,3}\.[\d]{0,3}\]|[\d]{0,3}\.[\d]{0,3}\.[\d]{0,3}\.[\d]{0,3}|[\w]+\.[\w]+\.[\w]+|[\w]+\-?[\w]+\.[\w]+)$');
    if (email.isEmpty) {
      return 'Required Field!';
    }
    if (!regExp.hasMatch(email)) {
      return 'Invalid Email Address!';
    }
    return null;
  }
}
