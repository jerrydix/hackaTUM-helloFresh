
import 'package:flutter/material.dart';
import 'package:flutter_version/RecipeManager.dart';
import 'package:flutter_version/widgets/toggle_ingredientType.dart';

import '../rest/Recipe.dart';
import '../widgets/recipe_card.dart';
import '../widgets/toggle_product.dart';
class LandingPage extends StatefulWidget {
  const LandingPage({super.key});
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {

  List<String> ingredients = RecipeManager.instance.ingredientTypesFormatted;
  List<String> selectedIngredients = [];
  List<String> notSelectedIngredients = [];

  @override
    Widget build(BuildContext context) {
      return Scaffold(
          body: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Image (
                  image: AssetImage('assets/OrangeFinal.png'),
                  height: 150,
                  width: 200,
                ),
                Padding(
                  padding:  EdgeInsets.symmetric(vertical: 15, horizontal: MediaQuery.of(context).size.width * 1 / 10),
                  child: Text("Let's start by selecting your favorite ingredient categories:",
                    style: Theme.of(context).textTheme.headlineMedium,
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 5 / 10,
                  alignment: Alignment.center,
                  child: Wrap(
                    children: List<Widget>.generate(
                      ingredients.length,
                          (int index) => toggleIngredient(title: ingredients[index], value: 1,),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: MediaQuery.of(context).size.width * 1 / 10),
                  child: Text("Select any dietary restrictions you may have:",
                    style: Theme.of(context).textTheme.headlineMedium,
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 5 / 10,
                  alignment: Alignment.center,
                  child: Wrap(
                    children: createAllergyTiles(),
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.symmetric(vertical: 15, horizontal: MediaQuery.of(context).size.width * 1 / 10),
                  child: Text("Alright, now let's get cooking!",
                    style: Theme.of(context).textTheme.headlineMedium,
                    textAlign: TextAlign.center,
                  ),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(const Size(200, 100)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                    ),
                    textStyle: MaterialStateProperty.all(Theme.of(context).textTheme.headlineMedium
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, "/home");
                  },
                  child: const Text("Save Preferences"),
                ),
              ],
            ),
          ),
          ),
      );
    }

    List<Widget> createAllergyTiles() {
      List<Widget> tiles = [];
      for (int i = 0; i < RecipeManager.instance.allAllergyStrings.length; i++) {
        tiles.add(
          Container(
            alignment: Alignment.center,
            width: 225,
            child: CheckboxListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              checkboxShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
              title: Text(RecipeManager.instance.allAllergyStrings[i]),
              value: RecipeManager.instance.allAllergies[i],
              onChanged: (newValue) {
                setState(() {
                  RecipeManager.instance.allAllergies[i] = newValue!;
                });
                print(RecipeManager.instance.allAllergies);
                print(RecipeManager.instance.allAllergyStrings);
              },
              controlAffinity: ListTileControlAffinity.leading,
            ),
          )
        );
      }
      print(tiles.length);
      return tiles;
    }
}