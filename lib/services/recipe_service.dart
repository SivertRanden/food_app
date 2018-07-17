import 'dart:async';
import "package:cloud_firestore/cloud_firestore.dart";

import 'package:food_app/models/recipe.dart';

class RecipeService {
  List<Recipe> _recipes;
  var recipesRef = Firestore.instance.collection("recipes");
  RecipeService() {
    _recipes = List<Recipe>();
  }

  void getRecipes() async {
    QuerySnapshot snapshot = await recipesRef.getDocuments();
    
  }
}