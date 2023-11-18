import 'package:flutter/material.dart';

class tag extends StatefulWidget {
  const tag({super.key, required this.content, required this.color});
  final String content;
  final Color color;

  @override
  _tagState createState() => _tagState();
}

class _tagState extends State<tag> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 5, left: 5, top: 5, bottom: 5),
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          minHeight: 25.0,
          minWidth: 50.0,
          maxHeight: 25.0,
          maxWidth: 100.0,
        ),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: widget.color,
            borderRadius: BorderRadius.circular(25),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: FittedBox(
                fit: BoxFit.fitWidth,
                child: Text(widget.content)
            ),
          )
        ),
      ),
    );
  }
}
