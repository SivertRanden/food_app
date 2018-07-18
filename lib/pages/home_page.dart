import "package:flutter/material.dart";
import "package:cloud_firestore/cloud_firestore.dart";

import "package:food_app/models/recipe.dart";
import "package:food_app/models/ingredient.dart";
import "package:food_app/models/nutrient.dart";

import "../UI/UI-utils.dart";
import "../UI/gradient-app-bar.dart";
import 'package:food_app/UI/recipe-card-list.dart';

import "../services/recipe_service.dart";

class HomePage extends StatefulWidget {
  @override
  State createState() => HomePageState();
}

class HomePageState extends State<HomePage> {

  RecipeService recipeService = RecipeService();
  List<Recipe> recipes;
  int selectedDay = -1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        GradientAppBar("FoodApp"),
        Expanded(
          child: Container(
            decoration: UIUtils.getDecoration(context),
            child: Stack(
              alignment: FractionalOffset(0.99, 0.99),
              children: <Widget>[
                RecipeCardList(recipes),
                FloatingActionButton(
                  child: Icon(Icons.refresh),
                  onPressed: () {
                    recipeService.getRecipes()
                      .then((_recipes) {
                        setState(() {
                          recipes = _recipes;
                        });
                      });
                  }
                )
              ]
            ) 
          )  
        )
      ]
    );
  }

  List<Recipe> getRecipes() {

  }
}