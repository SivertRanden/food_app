import 'package:flutter/material.dart';

import 'package:food_app/UI/recipe-details.dart';

import 'package:food_app/models/recipe.dart';

class RecipeCardList extends StatelessWidget {
  final List<Recipe> _recipes;

  final List<String> days = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"];

  RecipeCardList(this._recipes);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _recipes == null ? 0 : _recipes.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          child: Center(
            child: (
              Card(
                margin: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(0.0, 4.0, 0.0, 0.0),
                      child: Text(days[index], style: TextStyle(fontWeight: FontWeight.bold))
                    ),
                    ListTile(
                      title: Text(_recipes[index].name),
                      subtitle: Text(_recipes[index].description)
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
                                  return RecipeDetails(days[index], _recipes[index]);
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
    );
  }
}