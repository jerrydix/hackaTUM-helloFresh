import 'package:flutter/material.dart';
import '../rest/recipe.dart';

class RecipePage extends StatefulWidget {
  const RecipePage({super.key, required this.recipe});

  final Recipe recipe;

  @override
  State<RecipePage> createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.recipe.name),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Expanded(
            child: Image.asset("assets/food_template.jpg"),/*Image.network(
              widget.recipe.image,
              fit: BoxFit.cover,
            ),*/
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.recipe.name,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}