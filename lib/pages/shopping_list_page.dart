import "package:flutter/material.dart";
import 'package:food_app/UI/UI-utils.dart';
import 'package:food_app/models/ingredient.dart';
import "../UI/gradient-app-bar.dart";

class ShoppingListPage extends StatefulWidget {
  @override
  State createState() => ShoppingListState();
}

class ShoppingListState extends State<ShoppingListPage> {
  
  List<Ingredient> _ingredients = [
    Ingredient("Minced meat", "400g"),
    Ingredient("Cheese", "alot"),
    Ingredient("Salsa", "1 jar"),
    Ingredient("Salad mix", "As much as you want"),
  ];

  List<Ingredient> _checked = [];

  //Get both lists of all ingredients and list of checked ingredients from user in firebase

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        GradientAppBar("FoodApp"),
        Expanded(
          child: Container(
            decoration: UIUtils.getDecoration(context),
            child: _buildShoppingList()
          )
        )
      ] 
    );
  }

  _buildShoppingList() {
    return Container(
      margin: EdgeInsets.only(left: 10.0, right: 10.0),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0), topRight: Radius.circular(10.0))
        )
      ),
      child: Column( 
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 10.0),
            child: Text("Shopping list", style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold
            ))
          ),
          Expanded( //List of shopping items
            child: Padding(
              padding: EdgeInsets.only(left: 8.0, right: 8.0),
              child: ListView.builder(
                itemCount: _ingredients == null ? 0 : _ingredients.length * 2,
                itemBuilder: (BuildContext context, int i) {
                  if(i.isOdd) {
                    return Divider();
                  }
                  final index = i ~/2;
                  return _buildRow(_ingredients[index]);
                }
              )
            )
          )
        ] 
      )
    );
  }

  Widget _buildRow(Ingredient ingredient) {
    final alreadyChecked = this._checked.contains(ingredient);
    return ListTile(
      dense: true,
      title: Text(
        ingredient.name,
        style: TextStyle(
          fontSize: 16.0,
          decoration: alreadyChecked ? TextDecoration.lineThrough : TextDecoration.none
        ),
      ),
      trailing: alreadyChecked ? Icon(Icons.check) : null,
      onTap: () {
        setState(() {
          if(alreadyChecked) {
            _checked.remove(ingredient);
          } else {
            _checked.add(ingredient);
          }
        });
      }
    );
  }
}
