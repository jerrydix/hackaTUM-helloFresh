import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_version/widgets/recipe_step.dart';
import 'package:flutter_version/widgets/table_widget.dart';
import 'package:flutter_version/widgets/table_nutrients.dart';

import 'package:flutter_version/widgets/tag.dart';
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
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  right: MediaQuery.of(context).size.height * 1 / 20),
              child: Text(widget.recipe.name,
                  style: Theme.of(context).textTheme.headlineMedium),
            ),
            const Icon(Icons.schedule),
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
                    child: Image.network(widget.recipe.imagePath,
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
                              Text("Nutrition", style: Theme.of(context).textTheme.headlineMedium),

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
                  child: Text('Allergens', style: Theme.of(context).textTheme.headlineMedium),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(getAllergy(), style: Theme.of(context).textTheme.headlineSmall),
                  ],
                ),
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

  String getAllergy(){
    List<String> allAllergyStrings = [
      "Soya",
      "Sulphur Dioxide",
      "Sesame Seeds",
      "Peanuts",
      "Nuts",
      "Mustard",
      "Molluscs",
      "Milk",
      "Lupin",
      "Fish",
      "Eggs",
      "Crustaceans",
      "Gluten",
      "Celery"
    ];
    List<String> allergy =[];
    final random = Random();
    for (int i = 0; i < 3; i++){
      var element = allAllergyStrings[random.nextInt(allAllergyStrings.length)];
      if(!allergy.contains(element)){
        allergy.add(element);
      }
    }
    return allergy.join(', ');
  }

  List<tag> genTagList(){
    bool vegan = true;
    Widget vegWidget;
    Widget veganWidget;
    bool less10 = false;
    Widget Widget10;
    Widget Widget30;
    bool less30 = false;
    bool ff = true;
    Widget ffwidget;
    bool kids = true;
    Widget kidsWidget;
    bool veget = true;
    bool less650 = false;
    Widget Widget650;
    bool hightProt = false;
    Widget WidgetProt;

    List<tag> tags = [];

    List<String> veganList = ["butter", "egg", "greek yogurt", "heavy cream", "cheese"];
    for (var ingredient in widget.recipe.ingredients){
      if (ingredient.type == "chicken breast" || ingredient.type == "bacon" || ingredient.type == "sausage"|| ingredient.type == "ham" || ingredient.type == "prosciutto" || ingredient.type == "rump steak"){
        veget = false;
      }
      if(veganList.contains(ingredient.type)){
        vegan = false;
      }
      if(ingredient.type == "sweet chili sauce" || ingredient.type == "chili flakes"){
        kids = false;
      }
    }
    if(kids){
      tags.add(const tag(content: 'kids', color: Colors.red));
    }
    if(vegan){
      tags.add(const tag(content: 'vegan', color: Colors.green));
    }
    if(veget){
      tags.add(const tag(content: 'vegeterian', color: Colors.green));
    }
    if(widget.recipe.calories < 650){
      tags.add(const tag(content: 'less 650', color: Colors.grey));
    }
    if(widget.recipe.proteins > 30){
      tags.add(const tag(content: 'high protein', color: Colors.yellow));
    }
    if(widget.recipe.time == 10){
      tags.add(const tag(content: '10 min', color: Colors.blue));
    }
    if(widget.recipe.time < 30){
      tags.add(const tag(content: 'less 30', color: Colors.orange));
    }
    return tags;
  }

}

