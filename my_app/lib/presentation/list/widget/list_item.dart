import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ListItem extends StatefulWidget {
  final String title;
  final int index;
  const ListItem({super.key, required this.title, required this.index});

  @override
  State<ListItem> createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  bool _isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.blue, borderRadius: BorderRadius.circular(5)),
      child: ListTile(
          title: Text(widget.title),
          subtitle: Text('item numer ${widget.index}'),
          leading: Checkbox(
            value: _isSelected,
            onChanged: (value) {
              setState(() {
                _isSelected = value ?? false;
              });
            },
          )),
    );
  }
}
