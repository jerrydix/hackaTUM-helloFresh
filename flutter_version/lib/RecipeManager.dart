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

  List<String> ingredientTypesSelected = [];
  List<String> ingredientTypesNotSelected = [];

  List<String> allergies = [];

  void addToTypesSublist(String type, bool selected) {
    List<String> currentList;
    if (selected) {
      currentList = ingredientTypesSelected;
    } else {
      currentList = ingredientTypesNotSelected;
    }

    switch(type) {
      case "Dairy and Eggs": currentList.add("DAIRY_AND_EGGS");
      break;
      case "Meat": currentList.add("MEAT");
      break;
      case "Seafood": currentList.add("SEAFOOD");
      break;
      case "Vegetables": currentList.add("VEGETABLES");
      break;
      case "Fruits": currentList.add("FRUITS");
      break;
      case "Grains and Cereals": currentList.add("GRAINS_AND_CEREALS");
      break;
      case "Legumes": currentList.add("LEGUMES");
      break;
      case "Nuts and Seeds": currentList.add("NUTS_AND_SEEDS");
      break;
      case "Herbs and Spices": currentList.add("HERBS_AND_SPICES");
      break;
      case "Sweeteners": currentList.add("SWEETENERS");
      break;
      case "Oils and Fats": currentList.add("OILS_AND_FATS");
      break;
      case "Beverages": currentList.add("BEVERAGES");
      break;
      case "Baking and Cooking Ingredients": currentList.add("BAKING_AND_COOKING_INGREDIENTS");
      break;
      case "Condiments and Sauces": currentList.add("CONDIMENTS_AND_SAUCES");
      break;
      case "Processed Foods": currentList.add("PROCESSED_FOODS");
      break;
      case "Misc": currentList.add("MISC");
      break;
    }

  }

  List<String> ingredientTypes = [
    "DAIRY_AND_EGGS",
    "MEAT",
    "SEAFOOD",
    "VEGETABLES",
    "FRUITS",
    "GRAINS_AND_CEREALS",
    "LEGUMES",
    "NUTS_AND_SEEDS",
    "HERBS_AND_SPICES",
    "SWEETENERS",
    "OILS_AND_FATS",
    "BEVERAGES",
    "BAKING_AND_COOKING_INGREDIENTS",
    "CONDIMENTS_AND_SAUCES",
    "PROCESSED_FOODS",
    "MISC"
  ];

  List<String> ingredientTypesFormatted = [
    "Dairy and Eggs",
    "Meat",
    "Seafood",
    "Vegetables",
    "Fruits",
    "Grains and Cereals",
    "Legumes",
    "Nuts and Seeds",
    "Herbs and Spices",
    "Sweeteners",
    "Oils and Fats",
    "Beverages",
    "Baking and Cooking Ingredients",
    "Condiments and Sauces",
    "Processed Foods",
    "Misc"
  ];



  //User stuff
  List<bool> allAllergies = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];
  List<String> selectedAllergies = [];
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

  void bitFieldToBoolList(int bits) {
    selectedAllergies = [];
    allAllergies = [
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false
    ];
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
      }
    }
  }

  List<String> excludedFoodList = [];

  late ValueNotifier<int> favoritesValue = ValueNotifier(favouriteRecipeCards.length);

  RecipeManager._internal();

  Future<void> fetchRecipes() async {
    allRecipes = [];
    allRecipeCards = [];
    var response = await http.get(
        Uri.parse('http://144.126.143.118:3000/recipe'));

    if (response.statusCode == 200) {
      final parsed = (jsonDecode(response.body) as List).cast<Map<String, dynamic>>();
      for (int i = 0; i < parsed.length; i++) {
        allRecipes.add(Recipe.fromJson(parsed[i]));
      }

      for (Recipe r in allRecipes) {
        allRecipeCards.add(RecipeCard(recipe: r, isFavourite: false,));
      }
      print(allRecipeCards);
    } else {
      throw Exception('Failed to load recipes ${response.statusCode}');
    }

    for (int i = 0; i < ingredientTypesNotSelected.length; i++) {
      var response = await http.get(Uri.parse('http://144.126.143.118:3000/ingredient/type/${ingredientTypesNotSelected[i]}'));
      if (response.statusCode == 200) {
        final parsed = (jsonDecode(response.body) as List).cast<Map<String, dynamic>>();
        for (int i = 0; i < parsed.length; i++) {
          excludedFoodList.add(parsed[i]["name"] as String);
        }
      } else {
        throw Exception('Failed to load recipes ${response.statusCode}');
      }
    }
  }

  void filterRecipes() {
    filteredRecipeCards = [];
    for (int i = 0; i < allRecipeCards.length; i++) {
      bool add = true;
      for (int j = 0; j < ingredientTypesSelected.length; j++) {
        if (!allRecipeCards[i].recipe.ingredients.contains(ingredientTypesSelected[j])) {
          add = false;
        }
      }
      for (int j = 0; j < ingredientTypesNotSelected.length; j++) {
        if (allRecipeCards[i].recipe.ingredients.contains(ingredientTypesNotSelected[j])) {
          add = false;
        }
      }
      for (int j = 0; j < selectedAllergies.length; j++) {
        if (allRecipeCards[i].recipe.allergyBits & (1 << j) != 0) {
          add = false;
        }
      }
      if (add) {
        filteredRecipeCards.add(allRecipeCards[i]);
      }
    }
  }
}