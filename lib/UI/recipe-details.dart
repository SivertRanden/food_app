import "package:flutter/material.dart";

import "../models/recipe.dart";
import "../models/ingredient.dart";
import "../models/nutrient.dart";

class RecipeDetails extends StatelessWidget {

  final String _day;
  final Recipe _recipe;

  RecipeDetails(this._day, this._recipe);

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Text(_day, textAlign: TextAlign.center),
      children: <Widget> [
        Text(_recipe.name, textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold)),
        Padding(
          padding: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget> [
              makeHeading("Recipe:"),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: getTextFromSteps(_recipe.steps)
              ),
              makeHeading("Ingredients:"),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: getTextFromIngredients(_recipe.ingredients)
              ),
              makeHeading("Nutrition:"),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: getTextFromNutrients(_recipe.nutrients)
              ),
              makeHeading("Allergens:"),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: getTextFromAllergens(_recipe.allergens)
              ),
            ]
          )
        )
      ]
    );
  }

  Padding makeHeading(String text) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0.0, 3.0, 0.0, 3.0),
      child: Text(text, style: TextStyle(fontWeight: FontWeight.bold))
    );
  }

  List<Text> getTextFromSteps(List<String> steps) {
    List<Text> textWidgets = [];
    for(int i = 0; i < steps.length; i++) {
      textWidgets.add(Text((i+1).toString() + " " + steps[i]));
    }
    return textWidgets;
  }

  List<Text> getTextFromIngredients(List<Ingredient> ingredients) {
    List<Text> textWidgets = [];
    for(int i = 0; i < ingredients.length; i++) {
      textWidgets.add(Text(ingredients[i].amount + " " + ingredients[i].name));
    }
    return textWidgets;
  }

  List<Text> getTextFromNutrients(List<Nutrient> nutrients) {
    List<Text> textWidgets = [];
    for(int i = 0; i < nutrients.length; i++) {
      textWidgets.add(Text(nutrients[i].amount + " " + nutrients[i].name));
    }
    return textWidgets;
  }

  List<Text> getTextFromAllergens(List<String> allergens) {
    List<Text> textWidgets = [];
    for(int i = 0; i < allergens.length; i++) {
      textWidgets.add(Text(allergens[i]));
    }
    return textWidgets;
  }

}