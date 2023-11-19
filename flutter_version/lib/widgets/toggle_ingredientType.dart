import 'package:flutter/material.dart';
import 'package:flutter_version/RecipeManager.dart';

class toggleIngredient extends StatefulWidget {
  const toggleIngredient({super.key, required this.title, required this.value});

  final String title;
  final int value;


  @override
  _toggleProductState createState() => _toggleProductState();
}

class _toggleProductState extends State<toggleIngredient> {
  late int choice;
  Color currentColor = Colors.red;

  @override
  void initState() {
    choice = widget.value;
    switch (choice) {
      case 0: currentColor = Colors.redAccent;
      break;
      case 1: currentColor = Colors.white;
      break;
      case 3: currentColor =  Colors.green[400]!;
    }
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 5, left: 5, top: 5, bottom: 5),
      child: Card(
        elevation: 3,
        color: currentColor,
        child: Padding(
            padding: const EdgeInsets.only(right: 5, left: 5, top: 5),
            child: SizedBox(
              width: 160,
              height: 80,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(widget.title, style: Theme
                        .of(context)
                        .textTheme
                        .bodyMedium, textAlign: TextAlign.center,),
                    Padding(padding: const EdgeInsets.only(bottom: 5),
                      child: SegmentedButton<int>(
                        style: ButtonStyle(shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(borderRadius: BorderRadius
                                .circular(8))),
                          surfaceTintColor: MaterialStateProperty.all(Colors.white)
                        ),
                        showSelectedIcon: false,
                        segments: const <ButtonSegment<int>>[
                          ButtonSegment<int>(
                              value: 0,
                              //label: Text('Day'),
                              icon: Icon(Icons.close)),
                          ButtonSegment<int>(
                              value: 1,
                              //label: Text('Week'),
                              icon: Icon(Icons.remove)),
                          ButtonSegment<int>(
                              value: 2,
                              //label: Text('Month'),
                              icon: Icon(Icons.check)),
                        ],
                        selected: <int>{choice},
                        onSelectionChanged: (Set<int> value) {
                          Color? color = Theme
                              .of(context)
                              .colorScheme
                              .primaryContainer;
                          switch (value.first) {
                          case 0: color = Colors.redAccent;
                          for (var e in RecipeManager.instance.ingredientTypesSelected) {
                            if (e == widget.title) {
                              RecipeManager.instance.ingredientTypesSelected.remove(e);
                              break;
                            }
                          }
                          RecipeManager.instance.ingredientTypesNotSelected.add(widget.title);
                          break;
                          case 1: color = Colors.white;
                          bool inFirst = false;
                          for (var e in RecipeManager.instance.ingredientTypesNotSelected) {
                            if (e == widget.title) {
                              inFirst = true;
                              RecipeManager.instance.ingredientTypesNotSelected.remove(e);
                              break;
                            }
                          }
                          if (!inFirst) {
                            for (var e in RecipeManager.instance.ingredientTypesSelected) {
                              if (e == widget.title) {
                                RecipeManager.instance.ingredientTypesSelected.remove(e);
                                break;
                              }
                            }
                          }
                          break;
                          case 2: color = Colors.green[400]!;
                          for (var e in RecipeManager.instance.ingredientTypesNotSelected) {
                            if (e == widget.title) {
                              RecipeManager.instance.ingredientTypesNotSelected.remove(e);
                              break;
                            }
                          }
                          RecipeManager.instance.ingredientTypesSelected.add(widget.title);
                          break;
                          }
                          setState(() {
                            choice = value.first;
                            currentColor = color!;
                          });
                          print(RecipeManager.instance.ingredientTypesNotSelected);
                          print(RecipeManager.instance.ingredientTypesSelected);
                        },
                      ),
                    )
                  ]
              ),

            )
        ),
      ),);
  }
}