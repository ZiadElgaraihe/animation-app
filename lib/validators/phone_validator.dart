String? phoneValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'This field is required';
  } else if ((!value.startsWith('01')) || value.length != 11) {
    return 'Invalid phone number';
  }
  return null;
}
