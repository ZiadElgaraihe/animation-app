import 'package:flutter/material.dart';

class AddItemButton extends StatelessWidget {
  final double width;
  final Function onPressed;
  const AddItemButton(
      {super.key, required this.width, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: ElevatedButton(
        onPressed: () {
          onPressed();
        },
        style: ButtonStyle(
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
          fixedSize: MaterialStatePropertyAll(Size(width - 42, 60)),
        ),
        child: const Icon(Icons.add),
      ),
    );
  }
}
