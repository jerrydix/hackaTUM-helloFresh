import 'dart:convert';

import 'package:flutter_version/rest/Recipe.dart';
import 'package:flutter_version/widgets/recipe_card.dart';
import 'package:http/http.dart' as http;

class RecipeManager {
  static final RecipeManager _instance = RecipeManager._internal();
  static RecipeManager get instance => _instance;

  List<Recipe> favouriteRecipes = [];
  List<RecipeCard> favouriteRecipeCards = [];
  List<Recipe> allRecipes = [];
  List<RecipeCard> allRecipeCards = [];

  RecipeManager._internal();

  Future<List<Recipe>> fetchRecipes() async {

    List<Recipe> result = [];
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));

    if (response.statusCode == 200) {
      //todo do for all recipes (loop over recipe json)
      result.add(Recipe.fromJson(jsonDecode(response.body) as Map<String, dynamic>));
    } else {
      throw Exception('Failed to load recipes');
    }
    return result;
  }
}