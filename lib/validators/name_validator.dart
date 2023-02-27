String? nameValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'This field is required';
  } else if (value.length < 2) {
    return 'Name can\'t be less than 2 character';
  }
  return null;
}
