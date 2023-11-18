
import 'dart:collection';

import 'package:flutter_version/rest/utensil.dart';

import 'ingredient.dart';

class Recipe {
  final int id;
  final String name;
  final String imagePath;
  final String description;
  final String timeString;
  final String difficulty;
  final List<String> steps;
  final int calories;
  final int proteins;
  final int carbs;
  final int fats;
  final int fiber;
  final List<LinkedHashMap<String, String>> vitamins;
  final List<LinkedHashMap<String, String>> minerals;
  final List<int> allergyBits;
  final List<Ingredient> ingredients;


  //final List<String> tags,

  Recipe({required this.name, required this.imagePath, required this.description, required this.steps, required this.ingredients, required this.difficulty, required this.calories, required this.proteins, required this.carbs, required this.fats, required this.fiber, required this.vitamins, required this.minerals, required this.allergyBits, required this.id, required this.timeString}) {
   // if (time.hour == 0) {
      //timeString = '${time.minute} min';
    /*} else {
      timeString = '${time.hour}:${time.minute} h';
    }*/
  }

  factory Recipe.fromJson(Map<String, dynamic> json) {
    String stepsString = json['instructions'] as String;
    List<String> stepList = stepsString.split('\n');
    List<Ingredient> ingredientList = [];
    List<Utensil> utensilList = [];

    for (int i = 0; i < json["ingredients"]["create"]; i++) {
      ingredientList.add(Ingredient.fromJson(json["ingredients"][i]));
    }

    for (int i = 0; i < json["utensils"]; i++) {
      utensilList.add(Utensil.fromJson(json["utensils"][i]));
    }


    return Recipe(
      id: json['id'] as int,
      name: json['title'] as String,
      imagePath: json['imgUrl'] as String,
      description: json['description'] as String,
      timeString: json['time'] as String,
      difficulty: json['difficulty'] as String,
      steps: stepList,
      calories: json['calories'] as int,
      proteins: json['proteins'] as int,
      carbs: json['carbs'] as int,
      fats: json['fats'] as int,
      fiber: json['fiber'] as int,
      vitamins: json['vitamins'] as List<LinkedHashMap<String, String>>,
      minerals: json['minerals'] as List<LinkedHashMap<String, String>>,
      allergyBits: json['allergyBits']['data'] as List<int>,
      ingredients: ingredientList,
      );
  }
}