import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final double width;
  final String title;
  final BorderSide side;
  final Color backgroundColor;
  final Color titleColor;
  final Function? onPressed;

  const CustomButton({
    super.key,
    required this.width,
    required this.title,
    this.side = BorderSide.none,
    this.backgroundColor = Colors.purple,
    this.titleColor = Colors.white,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (onPressed != null) {
          onPressed!();
        }
      },
      style: ButtonStyle(
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
              side: side,
            ),
          ),
          backgroundColor: MaterialStatePropertyAll(backgroundColor),
          fixedSize: MaterialStatePropertyAll(Size(width - 42, 60))),
      child: Text(
        title,
        style: TextStyle(color: titleColor),
      ),
    );
  }
}
