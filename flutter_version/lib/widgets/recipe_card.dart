import 'dart:ui';

import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:blur/blur.dart';
import 'package:flutter_version/pages/recipe_page.dart';


import '../rest/recipe.dart';

class RecipeCard extends StatelessWidget {
  final Recipe recipe;
  const RecipeCard({
    super.key,
    required this.recipe,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(left: clampDouble(MediaQuery.of(context).size.width * 1/10, 0, 500), right: clampDouble(MediaQuery.of(context).size.width * 1/10, 0, 500), top: 8),
      elevation: 3,
      child: OpenContainer(
        transitionType: ContainerTransitionType.fadeThrough,
        closedColor: Theme.of(context).colorScheme.secondaryContainer,
        middleColor: Theme.of(context).colorScheme.background,
        openColor: Theme.of(context).colorScheme.background,
        transitionDuration: const Duration(milliseconds: 350),
        closedShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        closedBuilder: (context, action) {
          return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 180,
                  child: Stack(
                    fit: StackFit.passthrough,
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8),
                        ),
                        child: Image.asset(recipe.imagePath, fit: BoxFit.cover),
                      ),
                      Column(
                        children: [
                          SizedBox(height: 132,),
                          Text( //todo fix alignment
                            recipe.name,
                            style: Theme.of(context).textTheme.headlineSmall,
                          ).frosted(
                            blur: 8,
                            padding: EdgeInsets.all(8),
                            width: MediaQuery.of(context).size.width,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IntrinsicHeight(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: (MediaQuery.of(context).size.width - MediaQuery.of(context).size.width * 2/10 - 16) / 2 - 8,
                            child: Text(
                              recipe.name,
                              style: const TextStyle(
                                fontSize: 18,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          VerticalDivider(
                            color: Theme.of(context).dividerColor,
                            thickness: 2,
                          ),
                          SizedBox(
                            width: (MediaQuery.of(context).size.width - MediaQuery.of(context).size.width * 2/10 - 16) / 2 - 8,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.schedule),
                                SizedBox(width: 3,),
                                Text(
                                  recipe.timeString,
                                  style: const TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                ),
              ],

          );
        },
        openBuilder: (context, action) {
          return RecipePage(recipe: recipe);
        },
      ),
    );
  }
}