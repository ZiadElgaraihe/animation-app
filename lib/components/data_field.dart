import 'package:flutter/material.dart';

class DataField extends StatelessWidget {
  final String fieldLabel;
  final IconData fieldIcon;
  final TextInputType keyboardType;
  final String? Function(String?) validator;

  const DataField({
    super.key,
    required this.fieldLabel,
    required this.fieldIcon,
    required this.keyboardType,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 4.0),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: TextFormField(
        validator: validator,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          border: InputBorder.none,
          labelText: fieldLabel,
          icon: Icon(fieldIcon),
        ),
      ),
    );
  }
}
