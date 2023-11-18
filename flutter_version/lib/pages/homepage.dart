import 'package:flutter/material.dart';
import 'package:flutter_version/rest/recipe.dart';
import 'package:flutter_version/widgets/recipe_card.dart';
import 'package:flutter_version/widgets/toggles.dart';

import '../RecipeManager.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  final bodyPadding = 24.0;
  bool AIenabled = false;
  RecipeManager manager = RecipeManager.instance;
  TextEditingController controller = TextEditingController();
  List<RecipeCard> recipeCards = RecipeManager.instance.allRecipeCards;

  @override
  void initState() {
    manager.dataFuture = manager.fetchRecipes();
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
                  length: 3,
                  child: Scaffold(
                    appBar: AppBar(
                      leadingWidth: 100,
                      title: Image.asset("assets/OrangeFinal.png", height: 130, width: 130),
                      centerTitle: true,
                      bottom: TabBar(
                        tabs: const [
                          Tab(icon: Icon(Icons.dinner_dining)),
                          Tab(icon: Icon(Icons.local_shipping)),
                          Tab(icon: Icon(Icons.kitchen)),
                        ],
                        splashBorderRadius: BorderRadius.circular(25),
                        padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 1/10),
                        //dividerColor: Colors.transparent,
                      ),
                      leading: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Row(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.fitness_center_rounded),
                              onPressed: () {}, // TODO: implement
                            ),
                            IconButton(
                              icon: const Icon(Icons.person),
                              onPressed: () {}, // TODO: implement
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
                              padding: EdgeInsets.only(top: 12, bottom: 12, left: MediaQuery.of(context).size.width * 1/10, right: MediaQuery.of(context).size.width * 1/10),
                              child: TextField(
                                  controller: controller,
                                  onChanged: (value) {
                                      filterRecipes(value);
                                  },
                                  decoration: InputDecoration(
                                    prefixIcon: const Icon(Icons.search),
                                    contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                                    fillColor: Theme.of(context).colorScheme.secondaryContainer,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(color: Theme.of(context).colorScheme.secondary),
                                    ),
                                    filled: true,
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
                                    ),
                                    hintText: "Search for recipes...",
                                    suffixIcon: Padding(
                                      padding: const EdgeInsets.only(right: 3),
                                      child: ToggleButtons(
                                        isSelected: [AIenabled],
                                        onPressed: (index) {
                                          setState(() {
                                            AIenabled = !AIenabled;
                                          });
                                        },
                                        selectedBorderColor: Colors.green[700],
                                        selectedColor: Colors.white,
                                        fillColor: Colors.green[200],
                                        color: Colors.green[400],
                                        borderRadius: BorderRadius.circular(7),
                                        constraints: const BoxConstraints(
                                          minHeight: 40.0,
                                          minWidth: 80.0,
                                        ),
                                        children: const [
                                          Text("AI"),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                  /*trailing: [
                                    ToggleButtons(
                                      isSelected: [AIenabled],
                                      onPressed: (index) {
                                        setState(() {
                                          AIenabled = !AIenabled;
                                        });
                                      },
                                      selectedBorderColor: Colors.green[700],
                                      selectedColor: Colors.white,
                                      fillColor: Colors.green[200],
                                      color: Colors.green[400],
                                      borderRadius: BorderRadius.circular(25),
                                      constraints: const BoxConstraints(
                                        minHeight: 40.0,
                                        minWidth: 80.0,
                                      ),
                                      children: const [
                                        Text("AI"),
                                      ],
                                    ),
                                  ]
                              ),*/
                            ),
                            Card(
                              elevation: 3,
                              margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 1/10, right: MediaQuery.of(context).size.width * 1/10),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              clipBehavior: Clip.antiAlias,
                              child: const ExpansionTile(
                                shape: Border(),
                                title: Text("Filters"),
                                children: [
                                  Text("Expanded content")
                                ],
                              ),
                            ),
                            Expanded(
                              child: ValueListenableBuilder<int>(
                                  valueListenable: RecipeManager.instance.favoritesValue,
                                  builder: (BuildContext context, int value, child ) {
                                    return ListView(
                                      children: [
                                        for (var recipeCard in recipeCards)
                                          recipeCard,
                                      ],
                                    );
                                  }
                              ),
                            ),
                          ],
                        ),
                        const Center(
                          child: Text("It's rainy here"),
                        ),
                        Container(
                          alignment: Alignment.center,
                          child:
                              Padding(
                                padding: EdgeInsets.only(top: 12, bottom: 12, left: MediaQuery.of(context).size.width * 1/10, right: MediaQuery.of(context).size.width * 1/10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      alignment: Alignment.center,
                                      child:
                                      toggles(products: ["Avocado", "Tomato", "Milk", "Potato", "Butter", "Flour", "Egg", "Carrot", "Meat", "Lemaon", "Garlic", "Nuts"], selectedProducts: ["Tomato"]),
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      child: Padding(
                                        padding: EdgeInsets.only(top: 10),
                                        child: ElevatedButton(
                                          onPressed: () {},
                                          child: const Text("Find recipes"),
                                        ),
                                      )
                                    ),

                            ],
                          ),
                        ),
                        ),
                      ],
                    ),
                  ),);
            }
            return const Center(child: CircularProgressIndicator());
          });

  }

  void filterRecipes(String value) {
    recipeCards = RecipeManager.instance.allRecipeCards;
    setState(() {
      recipeCards = recipeCards.where((element) =>
          element.recipe.name.toLowerCase().contains(value.toLowerCase()) || element.recipe.description.contains(value.toLowerCase()) || element.recipe.ingredients.contains(value.toLowerCase()) || element.recipe.steps.contains(value.toLowerCase())
      ).toList();
    });
  }
}

