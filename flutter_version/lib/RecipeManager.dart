import 'dart:collection';
import 'dart:convert';
import 'dart:io';

import 'package:b/b.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_version/rest/recipe.dart';
import 'package:flutter_version/widgets/recipe_card.dart';
import 'package:http/http.dart' as http;

class RecipeManager with ChangeNotifier {
  static final RecipeManager _instance = RecipeManager._internal();
  static RecipeManager get instance => _instance;

  //Recipe stuff
  List<Recipe> favouriteRecipes = [];
  List<RecipeCard> favouriteRecipeCards = [];
  List<Recipe> allRecipes = [];
  List<RecipeCard> allRecipeCards = [];
  Future<void> dataFuture = Future(() => null);
  List<RecipeCard> filteredRecipeCards = [];

  //User stuff
  List<bool> allAllergies = [false, false, false, false, false, false, false, false, false, false, false, false, false, false];
  List<String> selectedAllergies = [];
  List<String> notSelectedAllergies = [];

  List<String> allAllergyStrings = ["Soya", "Sulphur Dioxide", "Sesame Seeds", "Peanuts", "Nuts", "Mustard", "Molluscs", "Milk", "Lupin", "Fish", "Eggs", "Crustaceans", "Gluten", "Celery"];

  void bitFieldToBoolList(int bits) {
    selectedAllergies = [];
    notSelectedAllergies = [];
    allAllergies = [false, false, false, false, false, false, false, false, false, false, false, false, false, false];
    final BaseConversion decimalToBinaryConverter = BaseConversion(
      from: base10,
      to: base2,
    );
    String bitFieldString = bits.toString();
    final String binary = decimalToBinaryConverter(bitFieldString);


    for (int i = binary.runes.length - 1; int != 0; i--) {
      if (i >= 13) {
        break;
      }
      if (String.fromCharCode(binary.runes.elementAt(i)) == "1") {
        allAllergies[i] = true;
        selectedAllergies.add(allAllergyStrings[i]);
      } else {
        allAllergies[i] = false;
        notSelectedAllergies.add(allAllergyStrings[i]);
      }
    }

  }
  late ValueNotifier<int> favoritesValue = ValueNotifier(favouriteRecipeCards.length);

  RecipeManager._internal();

  Future<List<Recipe>> fetchRecipes() async {

    List<Recipe> result = [];
    var response = await http.get(Uri.parse('http://75.119.136.109:3000/recipe'));

    if (response.statusCode == 200) {
      final parsed = (jsonDecode(response.body) as List).cast<Map<String, dynamic>>();
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
