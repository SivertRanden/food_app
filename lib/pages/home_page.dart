import "package:flutter/material.dart";

import "../models/recipe.dart";
import "../models/ingredient.dart";
import "../models/nutrient.dart";

import "../UI/gradient-app-bar.dart";
import "../UI/recipe-details.dart";

class HomePage extends StatefulWidget {
  @override
  State createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  
  List<String> days = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"];

  //Mock data
  List<Recipe> recipes = [
    Recipe("Taco1", "Dinner", "Meat", "", "A typical taco dinner", 
      [Ingredient("Ground beef", "400g"), Ingredient("Tortilla", "6 pieces")], 
      ["Cook meat", "Put in taco seasoning", "Put in tortilla", "Enjoy"],
      [Nutrient("Protein", "100g"), Nutrient("Fat", "30g"), Nutrient("Carbohydrate", "150g")],
      ["Beef", "Flour"]
    ),
    Recipe("Taco2", "Dinner", "Meat", "", "A typical taco dinner", 
      [Ingredient("Ground beef", "400g"), Ingredient("Tortilla", "6 pieces")], 
      ["Cook meat", "Put in taco seasoning", "Put in tortilla", "Enjoy"],
      [Nutrient("Protein", "100g"), Nutrient("Fat", "30g"), Nutrient("Carbohydrate", "150g")],
      ["Beef, Flour"]
    ),
    Recipe("Taco3", "Dinner", "Meat", "", "A typical taco dinner", 
      [Ingredient("Ground beef", "400g"), Ingredient("Tortilla", "6 pieces")], 
      ["Cook meat", "Put in taco seasoning", "Put in tortilla", "Enjoy"],
      [Nutrient("Protein", "100g"), Nutrient("Fat", "30g"), Nutrient("Carbohydrate", "150g")],
      ["Beef, Flour"]
    )
  ];
  int selectedDay = -1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        GradientAppBar("FoodApp"),
        Expanded(child:
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerRight,
              end: Alignment.centerLeft,
              stops: [0.1, 0.5, 0.7, 0.9],
              colors: [
                Colors.orange[500],
                Colors.orange[600],
                Colors.orange[500],
                Colors.orange[400]
              ]
            )
          ),
          child: ListView.builder(
            itemCount: recipes == null ? 0 : recipes.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                child: Center(
                  child: (
                    Card(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.fromLTRB(0.0, 4.0, 0.0, 0.0),
                            child: Text(days[index], style: TextStyle(fontWeight: FontWeight.bold))
                          ),
                          ListTile(
                            title: Text(recipes[index].name),
                            subtitle: Text(recipes[index].description)
                          ),
                          ButtonTheme.bar(
                            height: 10.0,
                            child: ButtonBar(
                              children: <Widget>[
                                FlatButton(
                                  child: Text("SEE DETAILS", style: TextStyle(color: Colors.orangeAccent)),
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return RecipeDetails(days[index], recipes[index]);
                                      }
                                    );
                                  }
                                )
                              ]
                            )
                          )
                        ]
                      ),
                    )
                  )
                )
              );
            }
          )
        ))
      ]
    );
  }
}