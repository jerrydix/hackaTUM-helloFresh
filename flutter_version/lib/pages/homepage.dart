import 'dart:convert';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_version/rest/recipe.dart';
import 'package:flutter_version/widgets/recipe_card.dart';
import 'package:flutter_version/widgets/toggles.dart';
import 'package:file_saver/file_saver.dart';
import 'package:file_picker/file_picker.dart';

import '../RecipeManager.dart';
import '../rest/ingredient.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  final bodyPadding = 24.0;
  RecipeManager manager = RecipeManager.instance;
  TextEditingController controller = TextEditingController();
  List<String> selected = [];

  TextEditingController calController = TextEditingController();
  TextEditingController fatController = TextEditingController();
  TextEditingController carbsController = TextEditingController();
  TextEditingController protController = TextEditingController();


  List<RecipeCard> recipeCards = RecipeManager.instance.allRecipeCards;

  @override
  void initState() {
    manager.dataFuture = manager.fetchRecipes();
    recipeCards = RecipeManager.instance.allRecipeCards;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
        future: manager.dataFuture,
        builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              const Center(child: CircularProgressIndicator());
              break;
            default:
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              }
              return DefaultTabController(
                initialIndex: 0,
                length: 2,
                child: Scaffold(
                  appBar: AppBar(
                    leadingWidth: 100,
                    title: Image.asset("assets/OrangeFinal.png",
                        height: 130, width: 130),
                    centerTitle: true,
                    bottom: TabBar(
                      tabs: const [
                        Tab(icon: Icon(Icons.dinner_dining)),
                        Tab(icon: Icon(Icons.fitness_center)),
                      ],
                      splashBorderRadius: BorderRadius.circular(25),
                      padding: EdgeInsets.symmetric(
                          horizontal:
                              MediaQuery.of(context).size.width * 2 / 10),
                      //dividerColor: Colors.transparent,
                    ),
                    leading: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.person),
                            onPressed: () {
                              Navigator.pushNamed(context, '/profile');
                            }, // TODO: implement
                          ),
                        ],
                      ),
                    ),
                    actions: [
                      IconButton(
                        icon: const Icon(Icons.favorite),
                        onPressed: () {
                          Navigator.pushNamed(context, '/favorites');
                        },
                      ),
                      const Padding(padding: EdgeInsets.only(right: 10)),
                    ],
                  ),
                  body: TabBarView(
                    children: <Widget>[
                      Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                top: 12,
                                bottom: 12,
                                left:
                                MediaQuery.of(context).size.width * 2 / 10,
                                right:
                                MediaQuery.of(context).size.width * 2 / 10),
                            child: TextField(
                              controller: controller,
                              onChanged: (value) {
                                setState(() {
                                  filterRecipes(value);
                                });
                              },
                              decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.search),
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 15),
                                fillColor: Theme.of(context)
                                    .colorScheme
                                    .secondaryContainer,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary),
                                ),
                                filled: true,
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary),
                                ),
                                hintText: "Search for recipes...",
                              ),
                            ),
                          ),
                          SingleChildScrollView(
                            child: Card(
                              elevation: 3,
                              margin: EdgeInsets.only(
                                  left: MediaQuery.of(context).size.width *
                                      2 /
                                      10,
                                  right: MediaQuery.of(context).size.width *
                                      2 /
                                      10),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              clipBehavior: Clip.antiAlias,
                              child: ExpansionTile(
                                shape: Border(),
                                title: Text("Filter ingredients"),
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    child: Container(
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            alignment: Alignment.center,
                                            child: toggles(products: const [
                                              "Avocado",
                                              "Tomato",
                                              "Milk",
                                              "Potato",
                                              "Butter",
                                              "Flour",
                                              "Egg",
                                              "Carrot",
                                              "Meat",
                                              "Lemaon",
                                              "Garlic",
                                              "Nuts"
                                            ], selectedProducts: selected),
                                          ),
                                          Container(
                                              alignment: Alignment.center,
                                              child: Padding(
                                                padding:
                                                EdgeInsets.only(top: 5, bottom: 10),
                                                child: ElevatedButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      filterHolodos(selected);
                                                    });
                                                  },
                                                  child: const Text(
                                                      "Apply Filters"),
                                                ),
                                              )),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(padding: EdgeInsets.only(top: 5)),
                          Expanded(
                            child: ValueListenableBuilder<int>(
                                valueListenable: RecipeManager.instance.favoritesValue,
                                builder: (BuildContext context, int value, child) {
                                  return ListView(
                                    children: [
                                      for (var recipeCard in recipeCards)
                                        recipeCard,
                                    ],
                                  );
                                }),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 150, vertical: 16),
                            child: Text("Your daily fitness plan", style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center,)
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 150, vertical: 16),
                            child: TextFormField(
                              controller: calController,
                              decoration: const InputDecoration(
                                border: UnderlineInputBorder(),
                                labelText: 'Calories',
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 150, vertical: 16),
                            child: TextFormField(
                              controller: fatController,
                              decoration: const InputDecoration(
                                border: UnderlineInputBorder(),
                                labelText: 'Fats',
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 150, vertical: 16),
                            child: TextFormField(
                              controller: carbsController,
                              decoration: const InputDecoration(
                                border: UnderlineInputBorder(),
                                labelText: 'Carbs',
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 150, vertical: 16),
                            child: TextFormField(
                              controller: protController,
                              decoration: const InputDecoration(
                                border: UnderlineInputBorder(),
                                labelText: 'Proteins',
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(onPressed: () {
                                createFCS();
                              }, icon: Icon(Icons.download, size: 50,)),
                              IconButton(onPressed: () async {
                                var picked = await FilePicker.platform.pickFiles();

                                if (picked != null) {
                                  List<int> decoded = [];
                                  for (var byte in picked.files.first.bytes!){
                                    decoded.add(byte);
                                  }
                                  String data = utf8.decode(decoded);
                                  print(data);
                                }
                              }, icon: Icon(Icons.upload_file, size: 50,))

                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              );
          }
          return const Center(child: CircularProgressIndicator());
        });
  }

  void setFromJson(String json) {
    Map<String, dynamic> map = jsonDecode(json);
    //RecipeManager.instance.excludedFoodList = map["exclusions"];


    setControllers(map["calories"] as int, map["fats"] as int, map["carbs"] as int, map["proteins"] as int);
    for (int i = 0; i < map["recipes"].length; i++) {
      for(int j = 0; j < RecipeManager.instance.allRecipeCards.length; j++) {
        if (RecipeManager.instance.allRecipeCards[j].recipe.id == map["recipes"][i]) {
          RecipeManager.instance.favouriteRecipeCards.add(RecipeManager.instance.allRecipeCards[j]);
        }
      }
    }
  }

  void filterRecipes(String value) {
    recipeCards = RecipeManager.instance.allRecipeCards;
    setState(() {
      recipeCards = recipeCards.where((element) =>
      element.recipe.name.toLowerCase().contains(value.toLowerCase()) || element.recipe.description.contains(value.toLowerCase()) || containsIngredient(element.recipe.ingredients, controller) || element.recipe.steps.contains(value.toLowerCase())
      ).toList();
    });
  }

  void filterHolodos(List<String> selectedProds){
    recipeCards = RecipeManager.instance.allRecipeCards;
    setState(() {
      for (var prod in selectedProds){
        recipeCards = recipeCards.where((element) => containsIngredientInSelected(element.recipe.ingredients, prod)).toList();
      }
    });
  }

  bool containsIngredientInSelected(List<Ingredient> ingredients, String value) {
    for (var ingredient in ingredients) {
      if (ingredient.type.toLowerCase().contains(value.toLowerCase())) {
        return true;
      }
    }
    return false;
  }

  bool containsIngredient(List<Ingredient> ingredients, TextEditingController controller) {
    for (var ingredient in ingredients) {
      if (ingredient.type.toLowerCase().contains(controller.text.toLowerCase())) {
        return true;
      }
    }
    return false;
  }

  void setControllers(int cals, int fats, int carbs, int prot) {
    calController.text = cals.toString();
    fatController.text = fats.toString();
    carbsController.text = carbs.toString();
    protController.text = prot.toString();
  }

  Future<void> createFCS() async {
    /*List<Recipe> recipes = RecipeManager.instance.favouriteRecipeCards.map((e) => e.recipe).toList();

    int cal() => calController.text != "" ? int.parse(calController.text) : 0;
    int cals = cal();
    int fat() => fatController.text != "" ? int.parse(fatController.text) : 0;
    int fats = fat();
    int carb() => carbsController.text != "" ? int.parse(carbsController.text) : 0;
    int carbs = carb();
    int prot() => protController.text != "" ? int.parse(protController.text) : 0;
    int prots = prot();

    print(recipes);

    Map<String, dynamic> json = {
      "exclusions": RecipeManager.instance.excludedFoodList,
      "calories": cals,
      "fats": fats,
      "carbs": carbs,
      "proteins": prots,
      "recipes": recipes.map((e) => e.id).toList()
    };
    print(json);

    var myFile = File('FCS.json');
    await myFile.writeAsString(jsonEncode(json));


    await FileSaver.instance.saveFile(name: "FCS",ext: ".json", mimeType: MimeType.json);*/
  }

  /*Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Basic dialog title'),
          content: const Text(
            'A dialog is a type of modal window that\n'
                'appears in front of app content to\n'
                'provide critical information, or prompt\n'
                'for a decision to be made.',
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Disable'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Enable'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }*/
}
