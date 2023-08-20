// Check Alpha Numeric
// True = not alnum
// False = Alnum

bool isPasswordAlphanumeric(String password) {
  RegExp letters = RegExp(r'[a-zA-Z]');
  RegExp numbers = RegExp(r'[0-9]');

  return letters.hasMatch(password) && numbers.hasMatch(password);
}

