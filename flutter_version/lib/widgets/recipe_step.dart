import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class recipe_step extends StatefulWidget {
  const recipe_step({super.key, required this.number, required this.content, required this.color});
  final int number;
  final String content;
  final Color color;

  @override
  _recipe_stepState createState() => _recipe_stepState();
}

class _recipe_stepState extends State<recipe_step> {
  static FlutterTts flutterTts = FlutterTts();
  Future _speak(String text) async {
    await flutterTts.setLanguage("en-US");
    await flutterTts.setPitch(1);
    await flutterTts.speak(text);
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(right: 20, left: 20, top: 20, bottom: 20),
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          minHeight: 120.0,
          minWidth: 240.0,
          maxHeight: 150.0,
          maxWidth: 300.0,
        ),
        child: DecoratedBox(
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(25), boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],),
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${widget.number}", style: TextStyle(fontSize: 40, color: widget.color)),
                        TextButton(child: const Icon(Icons.campaign), onPressed: () => _speak(widget.content), ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25, top: 25, bottom: 25),
                  child: Container(
                      child:
                        Text("${widget.content}"),
                      ),
                    ),
                  ),
            ],
          ),
        ),
      )
    );
  }
}