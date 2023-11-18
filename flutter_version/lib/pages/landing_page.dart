import 'package:flutter/material.dart';
import 'package:flutter_version/RecipeManager.dart';

import '../rest/Recipe.dart';
import '../widgets/recipe_card.dart';
class LandingPage extends StatefulWidget {
  const LandingPage({super.key});
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {

    @override
    Widget build(BuildContext context) {
      return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                const Image (
                  image: AssetImage('assets/OrangeFinal.png'),
                  height: 150,
                  width: 200,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: MediaQuery.of(context).size.width * 1 / 10),
                  child: Text("Let's start by selecting your favorite ingredients:",
                    style: Theme.of(context).textTheme.headlineMedium,
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 10, //TODO
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: MediaQuery.of(context).size.width * 1 / 10),
                  child: Text("Select any dietary restrictions you may have:",
                    style: Theme.of(context).textTheme.headlineMedium,
                    textAlign: TextAlign.center,
                  ),
                ),
                Column(
                  children: createAllergyTiles(),
                ),

              ],
            ),
          ),
      );
    }

    List<Widget> createAllergyTiles() {
      List<Widget> tiles = [];
      for (var allergy in RecipeManager.instance.allAllergyStrings) {
        tiles.add(
          CheckboxListTile(
            title: Text(allergy),
            value: false,
            onChanged: (newValue) {
              setState(() {
                //TODO
              });
            },
            controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
          ),
        );
      }
      print(tiles.length);
      return tiles;
    }

}