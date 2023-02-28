import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  final String text;
  final Function? onPressed;
  final int? index;
  const ListItem({super.key, required this.text, this.onPressed, this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
            side: const BorderSide(color: Colors.purple)),
        elevation: 5,
        child: ListTile(
          title: Padding(
            padding: const EdgeInsets.only(left: 14.0),
            child: Text(
              text,
              style: const TextStyle(color: Colors.purple),
            ),
          ),
          trailing: IconButton(
              onPressed: () {
                if (onPressed != null) {
                  onPressed!(index);
                }
              },
              icon: const Icon(
                Icons.delete,
                color: Colors.purple,
              )),
        ),
      ),
    );
  }
}
