import "./recipe.dart";

class User {
  String _id;
  List<Recipe> _activeRecipes;

  User(this._id, this._activeRecipes);

  get id => this._id;
  get activeRecipes => activeRecipes;
}