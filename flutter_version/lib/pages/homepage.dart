import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  final bodyPadding = 24.0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        initialIndex: 1,
        length: 3,
      child: Scaffold(
        appBar: AppBar(
          leadingWidth: 100,
          title: const Text('RecipeApp'),
          centerTitle: true,
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.dinner_dining)),
              Tab(icon: Icon(Icons.local_shipping)),
              Tab(icon: Icon(Icons.kitchen)),
            ],
            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width / 8),
            dividerColor: Colors.transparent,
          ),
          leading: Padding(
            padding: EdgeInsets.only(left: 10),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.fitness_center_rounded),
                  onPressed: () {}, // TODO: implement
                ),
                IconButton(
                  icon: Icon(Icons.person_outline),
                  onPressed: () {}, // TODO: implement
                ),
              ],
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.favorite_outline),
              onPressed: () {},
            ),
            Padding(padding: EdgeInsets.only(right: 10)),
          ],
        ),
        body: TabBarView(
          children: <Widget>[
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(24),
                  child: SearchBar(
                    hintText: 'Search',
                    onChanged: (value) {},
                    leading: Icon(Icons.search),
                    trailing: [
                      ElevatedButton(
                        onPressed: () {},
                        child: Text('Filter'),
                      ),
                    ]
                  ),
                ),
                Expanded(
                  child: ListView(
                    children: [
                      ListTile(
                        leading: Icon(Icons.fastfood),
                        title: Text('Food'),
                        subtitle: Text('Food is any substance consumed to provide nutritional support for an organism. Food is usually of plant, animal or fungal origin, and contains essential nutrients, such as carbohydrates, fats, proteins, vitamins, or minerals.'),
                      ),
                      ListTile(
                        leading: Icon(Icons.fastfood),
                        title: Text('Food'),
                        subtitle: Text('Food is any substance consumed to provide nutritional support for an organism. Food is usually of plant, animal or fungal origin, and contains essential nutrients, such as carbohydrates, fats, proteins, vitamins, or minerals.'),
                      ),
                      ListTile(
                        leading: Icon(Icons.fastfood),
                        title: Text('Food'),
                        subtitle: Text('Food is any substance consumed to provide nutritional support for an organism. Food is usually of plant, animal or fungal origin, and contains essential nutrients, such as carbohydrates, fats, proteins, vitamins, or minerals.'),
                      ),
                      ListTile(
                        leading: Icon(Icons.fastfood),
                        title: Text('Food'),
                        subtitle: Text('Food is any substance consumed to provide nutritional support for an organism. Food is usually of plant, animal or fungal origin, and contains essential nutrients, such as carbohydrates, fats, proteins, vitamins, or minerals.'),
                      ),
                      ListTile(
                        leading: Icon(Icons.fastfood),
                        title: Text('Food'),
                        subtitle: Text('Food is any substance consumed to provide nutritional support for an organism. Food is usually of plant, animal or fungal origin, and contains essential nutrients, such as carbohydrates, fats, proteins, vitamins, or minerals.'),
                      ),
                      ListTile(
                        leading: Icon(Icons.fastfood),
                        title: Text('Food'),
                        subtitle: Text('Food is any substance consumed to provide nutritional support for an organism. Food is usually of plant, animal or fungal origin, and contains essential nutrients, such as carbohydrates, fats, proteins, vitamins, or minerals.'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Center(
              child: Text("It's rainy here"),
            ),
            Center(
              child: Text("It's sunny here"),
            ),
          ],
        ),
      ),);
  }
}

