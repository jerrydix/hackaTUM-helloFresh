import 'package:flutter/material.dart';
import 'package:flutter_version/widgets/recipe_step.dart';
import 'package:flutter_version/widgets/table_widget.dart';
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
    return SingleChildScrollView(
      child: Column(children: [
        Padding(
          padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 1 / 20,
              bottom: MediaQuery.of(context).size.height * 1 / 20),
          child: Row(
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
              Text(" 40 min", style: Theme.of(context).textTheme.headlineSmall)
            ],
          ),
        ),
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
                  child: Image.asset("assets/food_template.jpg",
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          right: MediaQuery.of(context).size.width * 1 / 12,
                          left: 0),
                      child: Container(
                        child: DataTableExample(
                          title: "Ingredients",
                          contents: LinkedHashMap<String, String>.from(
                              {"Tomato": "Test"}),
                          numItems: 1,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          right: 0,
                          left: MediaQuery.of(context).size.width * 1 / 12),
                      child: Container(
                        child: DataTableExample(
                          title: "Nutrients",
                          contents: LinkedHashMap<String, String>.from(
                              {"Proteins": "Test"}),
                          numItems: 1,
                        ),
                      ),
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
              child: Text('Allegens', style: Theme.of(context).textTheme.headlineMedium),)

            ],
          ),
        ),
      ]),
    );
  }
  List<recipe_step> genList(){
    return List<recipe_step>.generate(10, (int index) => recipe_step(number: index, content: 'content', color: Colors.green));
  }

  List<tag> genTagList(){
    return List<tag>.generate(10, (int index) => tag(content: 'high protein', color: Colors.green));
  }
}

