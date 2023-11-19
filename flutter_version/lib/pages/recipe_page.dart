import 'package:flutter/material.dart';
import 'package:flutter_version/rest/ingredient.dart';
import 'package:flutter_version/widgets/recipe_step.dart';
import 'package:flutter_version/widgets/table_widget.dart';
import 'package:flutter_version/widgets/table_nutrients.dart';

import 'package:flutter_version/widgets/tag.dart';
import '../rest/recipe.dart';
import 'dart:collection';

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
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  right: MediaQuery.of(context).size.height * 1 / 20),
              child: Text(widget.recipe.name,
                  style: Theme.of(context).textTheme.headlineMedium),
            ),
            Icon(Icons.schedule),
            //Text(widget.recipe.time.toString() + " min", style: Theme.of(context).textTheme.headlineMedium),
            Text(" ${widget.recipe.time} min", style: Theme.of(context).textTheme.headlineSmall)
          ],
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      right: MediaQuery.of(context).size.width * 1 / 10,
                      left: MediaQuery.of(context).size.width * 1 / 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Image.network("${widget.recipe.imagePath}",
                        fit: BoxFit.cover),
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 10, bottom: 10, right: MediaQuery.of(context).size.width * 1 / 10, left: MediaQuery.of(context).size.width * 1 / 10),
                  child: Wrap(
                    children: genTagList(),
                  ),),
                Padding(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).size.height * 1 / 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                          padding: EdgeInsets.only(
                              right: MediaQuery.of(context).size.width * 1 / 12,
                              left: 0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,

                            children: [
                              Text("Ingredients", style: Theme.of(context).textTheme.headlineMedium),
                              ConstrainedBox(
                                constraints: const BoxConstraints(
                                  maxHeight: 350.0,
                                  maxWidth: 200.0,
                                ),
                                child: DataTableExample(
                                  title: "Ingredients",
                                  contents: widget.recipe.ingredients,
                                  numItems: widget.recipe.ingredients.length,
                                ),
                              ),
                            ],
                          )
                      ),
                      Padding(
                          padding: EdgeInsets.only(
                              right: 0,
                              left: MediaQuery.of(context).size.width * 1 / 12),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,

                            children: [
                              Text("Nutritions", style: Theme.of(context).textTheme.headlineMedium),

                              ConstrainedBox(
                                constraints: const BoxConstraints(
                                  maxHeight: 350.0,
                                  maxWidth: 200,
                                ),
                                child: DataTableExample2(
                                  title: "Nutrition",
                                  names: ["Calories", "Fat", "Carbs", "Protein"] + List<String>.from(widget.recipe.minerals.keys) + List<String>.from(widget.recipe.vitamins.keys),
                                  values: ['${widget.recipe.calories}', '${widget.recipe.fats}', '${widget.recipe.carbs}', '${widget.recipe.proteins}'] + List<String>.from(widget.recipe.minerals.values) + List<String>.from(widget.recipe.vitamins.values),
                                  numItems: widget.recipe.minerals.length + widget.recipe.vitamins.length + 4,
                                ),
                              ),
                            ],
                          )
                      ),
                    ],
                  ),
                ),
                Text("Recipe", style: Theme.of(context).textTheme.headlineMedium),
                Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Wrap(

                        children: genList(),
                      )
                    ]
                ),
                Padding(
                  padding: EdgeInsets.only(top: MediaQuery.of(context).size.width * 1 / 20),
                  child: Text('Allergens', style: Theme.of(context).textTheme.headlineMedium),)
              ],
            ),
          ),
        ]),
      ),
    );
  }
  List<recipe_step> genList(){
    return List<recipe_step>.generate(widget.recipe.steps.length, (int index) => recipe_step(number: index + 1, content: widget.recipe.steps[index], color: Colors.green));
  }

  List<tag> genTagList(){
    return List<tag>.generate(10, (int index) => tag(content: 'high protein', color: Colors.green));
  }
}

