import 'dart:collection';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_version/rest/recipe.dart';
import 'package:flutter_version/widgets/recipe_card.dart';
import 'package:http/http.dart' as http;

class RecipeManager with ChangeNotifier {
  static final RecipeManager _instance = RecipeManager._internal();
  static RecipeManager get instance => _instance;

  List<Recipe> favouriteRecipes = [];
  List<RecipeCard> favouriteRecipeCards = [];
  List<Recipe> allRecipes = [];
  List<RecipeCard> allRecipeCards = [];
  Future<void> dataFuture = Future(() => null);
  List<RecipeCard> filteredRecipeCards = [];

  late ValueNotifier<int> favoritesValue = ValueNotifier(favouriteRecipeCards.length);

  RecipeManager._internal();

  Future<List<Recipe>> fetchRecipes() async {

    List<Recipe> result = [];
    var response = await http.get(Uri.parse('http://75.119.136.109:3000/recipe')); /*headers: {"Access-Control-Allow-Origin": "*", "Content-Type": "application/json","Accept": "text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*\/*;q=0.8,application/signed-exchange;v=b3;q=0.7", "Accept-Encoding": "gzip, deflate"});*/*/
    //print(response.body);

    if (response.statusCode == 200) {
      //todo do for all recipes (loop over recipe json)
      //print(response.body);
      final parsed = (jsonDecode(response.body) as List).cast<Map<String, dynamic>>();
      //print(parsed);
      for (int i = 0; i < parsed.length; i++) {
        result.add(Recipe.fromJson(parsed[i]));
      }

      for (Recipe r in result) {
        allRecipeCards.add(RecipeCard(recipe: r, isFavourite: false,));
      }

    } else {
      throw Exception('Failed to load recipes');
    }
    return result;
  }

}
