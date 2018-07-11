import "package:flutter/material.dart";

import "../UI/gradient-app-bar.dart";
import "../models/recipe.dart";
class RecipeDetailsPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            stops: [0.1, 0.5, 0.7, 0.9],
            colors: [
              Colors.orange[800],
              Colors.orange[700],
              Colors.orange[600],
              Colors.orange[400]
            ]
          )
        ),
      )
    );
  }
}