String? confirmPasswordValidator(String? value, String passWord) {
  if (passWord != value) {
    return 'This field must be as same as the password field';
  }
  return null;
}
