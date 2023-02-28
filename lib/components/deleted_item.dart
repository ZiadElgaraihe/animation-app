import 'package:flutter/material.dart';

class DeletedItem extends StatelessWidget {
  const DeletedItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Card(
        color: Colors.red,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
            side: const BorderSide(color: Colors.red)),
        elevation: 5,
        child: const ListTile(
          title: Padding(
            padding: EdgeInsets.only(left: 14.0),
            child: Text(
              'Deleted',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
