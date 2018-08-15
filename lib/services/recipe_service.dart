import 'dart:async';
import "package:cloud_firestore/cloud_firestore.dart";

import 'package:food_app/models/recipe.dart';

class RecipeService {
  
  CollectionReference recipesRef = Firestore.instance.collection("recipes");

  Future<List<Recipe>> getRecipes() async {
    List<Recipe> recipes = [];
    QuerySnapshot snapshot = await recipesRef.getDocuments();
    snapshot.documents.forEach((document) {
      recipes.add(Recipe.fromMap(document.data));
    });
    print(recipes);
    return recipes;
  }
}