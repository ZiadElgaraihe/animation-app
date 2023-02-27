import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
  final String fieldLabel;
  final String? Function(String?) validator;
  final TextEditingController? controller;

  const PasswordField({
    super.key,
    required this.fieldLabel,
    required this.validator,
    this.controller,
  });

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool showPassword = false;

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
        controller: widget.controller,
        validator: widget.validator,
        keyboardType: TextInputType.visiblePassword,
        obscureText: !showPassword,
        decoration: InputDecoration(
          border: InputBorder.none,
          labelText: widget.fieldLabel,
          icon: const Icon(Icons.lock_outline),
          //5)Use the suffixIcon
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                showPassword = !showPassword;
              });
            },
            icon: Icon(showPassword ? Icons.visibility : Icons.visibility_off),
          ),
        ),
      ),
    );
  }
}
