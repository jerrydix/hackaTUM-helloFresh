import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_version/RecipeManager.dart';
import 'package:flutter_version/widgets/toggle_ingredientType.dart';

class ProfileSettingsPage extends StatefulWidget {
  const ProfileSettingsPage({super.key});

  @override
  _ProfileSettingsState createState() => _ProfileSettingsState();
}

class _ProfileSettingsState extends State<ProfileSettingsPage> {
  List<String> ingredients = RecipeManager.instance.ingredientTypesFormatted;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Icon(Icons.person, size: 100),
          Padding(
            padding: EdgeInsets.only(top: 10, bottom: 10),
            child:
            Text("Jonas", style: Theme.of(context).textTheme.headlineMedium),),
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
          Container(
            width: MediaQuery.of(context).size.width * 5 / 10,
            alignment: Alignment.center,
            child: Wrap(
              children: createAllergyTiles(),
            ),
          ),
        ],
      )
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