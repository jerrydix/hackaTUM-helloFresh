import 'package:flutter/material.dart';

class toggleProduct extends StatefulWidget {
  toggleProduct({super.key, required this.title, required this.enabled, required this.selected});
  final String title;
  final List<String> selected;
  bool enabled;

  @override
  _toggleProductState createState() => _toggleProductState();
}

class _toggleProductState extends State<toggleProduct> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(right: 5, left: 5, top: 5, bottom: 5),
        child: ToggleButtons(
      isSelected: [widget.enabled],
      onPressed: (index) {
        setState(() {
          widget.enabled = !widget.enabled;
          if(widget.enabled){
            widget.selected.add(widget.title);
          } else {
            widget.selected.remove(widget.title);
          }
        });
      },
      selectedBorderColor: Colors.green[700],
      selectedColor: Colors.white,
      fillColor: Colors.green[200],
      color: Colors.green[400],
      borderRadius: BorderRadius.circular(7),
      constraints: const BoxConstraints(
        minHeight: 80.0,
        minWidth: 160.0,
      ),
      children: [
        Text(widget.title),
      ],
    ),
    );
  }
}