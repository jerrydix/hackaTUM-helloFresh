import 'dart:ui';

import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:blur/blur.dart';
import 'package:flutter_version/RecipeManager.dart';
import 'package:flutter_version/pages/recipe_page.dart';

import '../rest/recipe.dart';

class RecipeCard extends StatefulWidget {
  final Recipe recipe;
  bool isFavourite;

  RecipeCard({super.key, required this.recipe, required this.isFavourite});

  @override
  State<RecipeCard> createState() => _RecipeCardState();
}

class _RecipeCardState extends State<RecipeCard> {

  Icon currentHeartIcon = const Icon(Icons.favorite_border);

  @override
  void initState() {
    if (widget.isFavourite) {
      currentHeartIcon = const Icon(Icons.favorite, color: Colors.red,);
    }
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(left: clampDouble(MediaQuery.of(context).size.width * 2/10, 0, 500), right: clampDouble(MediaQuery.of(context).size.width * 2/10, 0, 500), top: 8),
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
                      child: Image.network(widget.recipe.imagePath, fit: BoxFit.cover),
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  color: Theme.of(context).colorScheme.secondaryContainer,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: IconButton(
                                    constraints: const BoxConstraints(
                                      maxWidth: 40,
                                      maxHeight: 40,
                                    ),
                                    onPressed: () {
                                      if (widget.isFavourite) {
                                        if (RecipeManager.instance.favouriteRecipeCards.contains(widget)) {
                                          RecipeManager.instance.favouriteRecipeCards.remove(widget);
                                        }
                                        RecipeManager.instance.favoritesValue.value--;
                                        print(RecipeManager.instance.favouriteRecipeCards.length);
                                        setState(() {
                                          currentHeartIcon = const Icon(Icons.favorite_border);
                                          widget.isFavourite = false;
                                        });
                                      } else {
                                        if (!RecipeManager.instance.favouriteRecipeCards.contains(widget)) {
                                          RecipeManager.instance.favouriteRecipeCards.add(widget);
                                        }
                                        RecipeManager.instance.favoritesValue.value++;
                                        print(RecipeManager.instance.favouriteRecipeCards.length);
                                        setState(() {
                                          currentHeartIcon = const Icon(Icons.favorite, color: Colors.red,);
                                          widget.isFavourite = true;
                                        });
                                      }
                                    },
                                    icon: currentHeartIcon,
                                    style: ButtonStyle(
                                      padding: MaterialStateProperty.all(EdgeInsets.zero),
                                      shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
                                    )
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 76,),
                        Text( //todo fix alignment
                          widget.recipe.name,
                          style: Theme.of(context).textTheme.headlineSmall,
                          overflow: TextOverflow.ellipsis,
                        ).frosted(
                          blur: 8,
                          padding: const EdgeInsets.all(8),
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
                          width: (MediaQuery.of(context).size.width - MediaQuery.of(context).size.width * 4/10 - 16) / 2 - 8,
                          child: Text(
                            widget.recipe.description,
                            style: const TextStyle(
                              fontSize: 18,
                            ),
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        VerticalDivider(
                          color: Theme.of(context).dividerColor,
                          thickness: 2,
                        ),
                        SizedBox(
                          width: (MediaQuery.of(context).size.width - MediaQuery.of(context).size.width * 4/10 - 16) / 2 - 8,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.schedule),
                              const SizedBox(width: 3,),
                              Text(
                                widget.recipe.timeString,
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
          return RecipePage(recipe: widget.recipe);
        },
      ),
    );
  }
}