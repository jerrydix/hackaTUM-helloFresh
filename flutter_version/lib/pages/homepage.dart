import 'package:flutter/material.dart';
import 'package:flutter_version/rest/recipe.dart';
import 'package:flutter_version/widgets/recipe_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  final bodyPadding = 24.0;
  bool AIenabled = false;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        initialIndex: 0,
        length: 3,
      child: Scaffold(
        appBar: AppBar(
          leadingWidth: 100,
          title: Image.asset("assets/Orange.png", height: 40, width: 40),
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
                  padding: const EdgeInsets.only(top: 12, bottom: 12),
                  child: SearchBar(
                    elevation: MaterialStateProperty.all(5),
                    hintText: 'Search for recipes...',
                    onChanged: (value) {},
                    leading: const Row(
                      children: [
                        Padding(padding: EdgeInsets.only(left: 5)),
                        Icon(Icons.search),
                      ],
                    ),
                    trailing: [
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
                  ),
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
                  child: ListView(
                    children: [
                      RecipeCard(
                          recipe: Recipe(
                              name: 'Chicken Soup',
                              imagePath: "assets/food_template.jpg",
                              abstract: 'This is a recipe for chicken soup',
                              description: 'This is a recipe for chicken soup',
                              time: DateTime.now(),
                              ingredients: ['Chicken', 'Soup'],
                              steps: ['Cook', 'Eat'],
                          ),
                        isFavourite: false,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Center(
              child: Text("It's rainy here"),
            ),
            const Center(
              child: Text("It's sunny here"),
            ),
          ],
        ),
      ),);
  }
}

