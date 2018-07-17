import "./ingredient.dart";
import "./nutrient.dart";

class Recipe {
  final String _name;
  final String _mealType;
  final String _tag;
  final String _imageUrl;
  final String _description;
  final List<Ingredient> _ingredients;
  final List<String> _steps;
  final List<Nutrient> _nutrients;
  final List<String> _allergens;

  Recipe(this._name, this._mealType, this._tag, this._imageUrl, this._description, this._ingredients, this._steps, this._nutrients, this._allergens);

  Recipe.fromMap(Map<String, dynamic> data)
    : this(
      data["name"],
      data["mealType"],
      data["tag"],
      data["imageUrl"],
      data["description"],
      _getIngredientsFromData(data["ingredients"]),
      data["steps"],
      _getNutrientsFromData(["nutrients"]),
      data["allergens"]
    );

  static List<Ingredient> _getIngredientsFromData(dynamic data) {
    List<Ingredient> ingredientList = [];
    data.forEach((ingredient) {
      ingredientList.add(Ingredient.fromMap(ingredient));
    });
    return ingredientList;
  }

  static List<Nutrient> _getNutrientsFromData(dynamic data) {
    List<Nutrient> nutrientList = [];
    data.forEach((nutrient) {
      nutrientList.add(Nutrient.fromMap(nutrient));
    });
    return nutrientList;
  }

  get name => _name;
  get mealType => _mealType;
  get tag => _tag;
  get imageUrl => _imageUrl;
  get description => _description;
  get ingredients => _ingredients;
  get steps => _steps;
  get nutrients => _nutrients;
  get allergens => _allergens;
}
