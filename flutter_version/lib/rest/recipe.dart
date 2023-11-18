
import 'dart:collection';

import 'package:flutter_version/rest/utensil.dart';

import 'ingredient.dart';

class Recipe {
  final int id;
  final String name;
  final String imagePath;
  final String description;
  final int time;
  final String difficulty;
  final List<String> steps;
  final int calories;
  final int proteins;
  final int carbs;
  final int fats;
  final int fiber;
  final Map<String, String> vitamins;
  final Map<String, String> minerals;
  final int allergyBits;
  final List<Ingredient> ingredients;
  late String timeString;


  Recipe({
    required this.name,
    required this.imagePath,
    required this.description,
    required this.steps,
    required this.ingredients,
    required this.difficulty,
    required this.calories,
    required this.proteins,
    required this.carbs,
    required this.fats,
    required this.fiber,
    required this.vitamins,
    required this.minerals,
    required this.allergyBits,
    required this.id,
    required this.time
  }) {
    timeString = '$time min';
  }

  factory Recipe.fromJson(Map<String, dynamic> json) {
    String stepsString = json['instructions'] as String;
    List<String> stepList = stepsString.split('\n');
    List<Ingredient> ingredientList = [];
    List<Utensil> utensilList = [];

    for (int i = 0; i < json["ingredients"].length; i++) {
      ingredientList.add(Ingredient.fromJson(json["ingredients"][i]));
    }

    for (int i = 0; i < json["utensils"].length; i++) {
      utensilList.add(Utensil.fromJson(json["utensils"][i]));
    }

    return Recipe(
      id: json['id'] as int,
      name: json['title'] as String,
      imagePath: json['imgUrl'] as String,
      description: json['description'] as String,
      time: json['duration'] as int,
      difficulty: json['difficulty'] as String,
      steps: stepList,
      calories: json['caloriesPerUnit'] as int,
      proteins: json['proteinsPerUnit'] as int,
      carbs: json['carbsPerUnit'] as int,
      fats: json['fatsPerUnit'] as int,
      fiber: json['fiberPerUnit'] as int,
      vitamins: Map.from(json['vitamins']),
      minerals: Map.from(json['minerals']),
      allergyBits: json['allergyBits'] as int,
      ingredients: ingredientList,
      );
  }
}