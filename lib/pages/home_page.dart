import "package:flutter/material.dart";
import "package:cloud_firestore/cloud_firestore.dart";
import 'package:food_app/app_state.dart';
import 'dart:async';

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

  AppState appstate;
  RecipeService recipeService = RecipeService();
  List<Recipe> recipes;
  bool showLoading = false;

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
                  child: Icon(Icons.assignment, size: 30.0,),
                  onPressed: () async {
                    setState(() {
                      showLoading = true;
                    });
                    recipes = await recipeService.getRecipes();
                    setState(() {
                      showLoading = false;
                    });
                  }
                ),
                Center(
                  child: showLoading ? SizedBox(
                    height: 50.0,
                    width: 50.0,
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.white,
                      value: null,
                      strokeWidth: 7.0,
                    ),
                  ) : null
                ),
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