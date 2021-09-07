import 'package:flutter/material.dart';
import 'package:recipes/utils/class.dart';
import 'package:recipes/utils/widgets.dart';

class DetailsPage extends StatelessWidget {
  final Recipe recipe;
  DetailsPage({required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 200.0,
              floating: false,
              pinned: true,
              title: Text(recipe.title),
              flexibleSpace: FlexibleSpaceBar(
                background: Hero(
                  tag: recipe.id,
                  child: FadeInImage(
                    image: NetworkImage(recipe.imageUrl),
                    fit: BoxFit.cover,
                    placeholder: AssetImage('assets/images/loading.gif'),
                  ),
                ),
              ),
            ),
          ];
        },
        body: Container(
          color: Theme.of(context).primaryColor,
          padding: EdgeInsets.only(top: 8.0),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: <Widget>[
                Text('Nutrition',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20)),
                NutritionWidget(
                  nutrients: recipe.nutrients,
                ),
                Divider(color: Colors.white, endIndent: 40.0, indent: 40.0),
                Text('Ingredients',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20)),
                IngredientsWidget(
                  ingredients: recipe.ingredients,
                ),
                Divider(color: Colors.white, endIndent: 40.0, indent: 40.0),
                Text('Steps',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20)),
                RecipeSteps(
                  steps: recipe.steps,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RecipeSteps extends StatelessWidget {
  final List<String> steps;
  RecipeSteps({this.steps = const []});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: steps.length,
      padding: const EdgeInsets.all(0.0),
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
            leading: CircleAvatar(
              backgroundColor: Theme.of(context).accentColor,
              child: Text('${index + 1}',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold)),
            ),
            title: Text(steps[index],
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16)));
      },
    );
  }
}

class IngredientsWidget extends StatelessWidget {
  final List<String>? ingredients;
  IngredientsWidget({this.ingredients});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: ListView.builder(
        itemCount: ingredients!.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Chip(
              backgroundColor: Theme.of(context).accentColor,
              label: Text(ingredients![index],
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold)),
            ),
          );
        },
      ),
    );
  }
}

class NutritionWidget extends StatelessWidget {
  final List<Nutrients>? nutrients;
  NutritionWidget({this.nutrients});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 86,
      width: double.infinity,
      child: Center(
        child: ListView.builder(
          itemCount: nutrients!.length,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return CircleIndicator(
              percent: nutrients![index].percent,
              nutrient: nutrients![index],
            );
          },
        ),
      ),
    );
  }
}
