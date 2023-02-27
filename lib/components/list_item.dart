import 'package:flutter/material.dart';

class ListItem extends StatefulWidget {
  final String text;
  final Function? onPressed;
  final int? index;
  const ListItem({super.key, required this.text, this.onPressed, this.index});

  @override
  State<ListItem> createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  bool isDeleted = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Card(
        color: (isDeleted) ? Colors.red : Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
            side: BorderSide(color: (isDeleted) ? Colors.red : Colors.purple)),
        elevation: 5,
        child: ListTile(
          title: Padding(
            padding: const EdgeInsets.only(left: 14.0),
            child: Text(
              isDeleted ? 'Deleted' : widget.text,
              style: TextStyle(color: isDeleted ? Colors.white : Colors.purple),
            ),
          ),
          trailing: isDeleted
              ? null
              : IconButton(
                  onPressed: () {
                    isDeleted = true;
                    if (widget.onPressed != null) {
                      widget.onPressed!(widget.index);
                    }
                    Future.delayed(
                      const Duration(milliseconds: 280),
                      () {
                        setState(() {
                          isDeleted = false;
                        });
                      },
                    );
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
