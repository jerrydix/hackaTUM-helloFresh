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
      ),
      body: Column(
        children: [
          Expanded(
            child: ValueListenableBuilder<int>(
              valueListenable: RecipeManager.instance.favoritesValue,
              builder: (BuildContext context, int value, child ) {
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