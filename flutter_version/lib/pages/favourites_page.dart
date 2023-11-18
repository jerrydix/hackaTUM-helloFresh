import 'package:flutter/material.dart';
import 'package:flutter_version/RecipeManager.dart';

import 'package:flutter_version/rest/recipe.dart';
import 'package:flutter_version/widgets/recipe_card.dart';

class FavouritesPage extends StatefulWidget {
  const FavouritesPage({super.key});

  @override
  State<FavouritesPage> createState() => _FavouritesPageState();
}

class _FavouritesPageState extends State<FavouritesPage> {
  RecipeManager recipeManager = RecipeManager.instance;
  bool AIenabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favourite Recipes"),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 12, bottom: 12),
            child: SearchBar(
                elevation: MaterialStateProperty.all(5),
                hintText: 'Search for recipes...',
                onChanged: (value) {},
                leading: const Row(
                  children: [
                    Padding(padding: EdgeInsets.only(left: 5)),
                    Icon(Icons.search),
                  ],
                ),
                trailing: [
                  ToggleButtons(
                    isSelected: [AIenabled],
                    onPressed: (index) {
                      setState(() {
                        AIenabled = !AIenabled;
                      });
                    },
                    selectedBorderColor: Colors.green[700],
                    selectedColor: Colors.white,
                    fillColor: Colors.green[200],
                    color: Colors.green[400],
                    borderRadius: BorderRadius.circular(25),
                    constraints: const BoxConstraints(
                      minHeight: 40.0,
                      minWidth: 80.0,
                    ),
                    children: const [
                      Text("AI"),
                    ],

                  ),
                ]
            ),
          ),
          Card(
            elevation: 3,
            margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 1/10, right: MediaQuery.of(context).size.width * 1/10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            clipBehavior: Clip.antiAlias,
            child: const ExpansionTile(
              shape: Border(),
              title: Text("Filters"),
              children: [
                Text("Expanded content")
              ],
            ),
          ),
          Expanded(
            child: ValueListenableBuilder<int>(
              valueListenable: RecipeManager.instance.favoritesValue,
              builder: (BuildContext context, int value, child ) {
                print("TATETSTS");
              return ListView(
                children: [
                  for (var recipeCard in RecipeManager.instance.favouriteRecipeCards)
                    recipeCard,
                ],
              );
            }

            ),
          ),
        ],
      ),
    );
  }
}