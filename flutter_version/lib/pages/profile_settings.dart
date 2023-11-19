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
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile", style: Theme.of(context).textTheme.bodyMedium,),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          child: Center(
              child: Column(
                children: [
                  const Icon(Icons.person, size: 100),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child:
                    Text("Jonas", style: Theme.of(context).textTheme.headlineMedium),),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: MediaQuery.of(context).size.width * 1 / 10),
                    child: Text("Set preferences",
                      style: Theme.of(context).textTheme.headlineMedium,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 6.8 / 10,
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
              child: const Divider()),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 7, horizontal: MediaQuery.of(context).size.width * 1 / 10),
                    child: Text("Select dietary restrictions",
                      style: Theme.of(context).textTheme.headlineMedium,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 6.8 / 10,
                    alignment: Alignment.center,
                    child: Wrap(
                      children: createAllergyTiles(),
                    ),
                  ),
                ],
              ),
          )
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