import "package:flutter/material.dart";
import "../UI/gradient-app-bar.dart";
import "../UI/UI-Utils.dart";

class ContactPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        GradientAppBar("FoodApp"),
        Expanded(
          child: Container(
            decoration: UIUtils.getDecoration(context)
          )
        )
      ]
    );
  }
}