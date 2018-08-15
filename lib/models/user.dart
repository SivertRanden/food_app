import 'package:food_app/models/ingredient.dart';

import "./recipe.dart";

class User {
  String _id;
  List<Recipe> _activeRecipes;
  List<Ingredient> _checkedIngredients;

  User(this._id, this._activeRecipes, List<Ingredient> checked) {
    this._checkedIngredients = checked ?? List<Ingredient>();
  }

  get id => this._id;
  get activeRecipes => _activeRecipes;
  get checkedIngredients => _checkedIngredients;

  set activeRecipes(List<Recipe> recipes) {
    this._activeRecipes = recipes;
  }

  User.fromMap(String id, Map<String, dynamic> data) 
  : this(
    id,
    _getRecipesFromData(data["activeRecipes"]),
    _getIngredientsFromData(["checkedIngredients"])
  );

  static List<Recipe> _getRecipesFromData(data) {
    List<Recipe> recipeList = [];
    data.forEach((recipe) {
      recipeList.add(Recipe.fromMap(recipe));
    });
    return recipeList;
  }

  static List<Ingredient> _getIngredientsFromData(data) {
    List<Ingredient> ingredientList = [];
    data.forEach((ingredient) {
      ingredientList.add(Ingredient.fromMap(ingredient));
    });
    return ingredientList;
  }

}