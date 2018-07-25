import "package:flutter/material.dart";
import "package:url_launcher/url_launcher.dart";

import 'dart:async';

import "../UI/gradient-app-bar.dart";
import "../UI/UI-Utils.dart";

class ContactPage extends StatelessWidget {

  final String feedbackEmail = "mealmatefeedback@gmail.com";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        GradientAppBar("FoodApp"),
        Expanded(
          child: Container(
            decoration: UIUtils.getDecoration(context),
            child: Container(
              margin: EdgeInsets.only(left: 10.0, right: 10.0),
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0), topRight: Radius.circular(10.0))
                )
              ),
              child: Center(
                child: FlatButton(
                  child: Text(feedbackEmail),
                  onPressed: ( () {
                    _openMailClient(feedbackEmail);
                  })
                )
              )
            )
          )
        )
      ]
    );
  }

  void _openMailClient(String email) async{
    final String url = "mailto:" + email;
    if(await canLaunch(url)) {
      await launch(url);
    } else {
      throw "Couldn't open email client";
    }
  }
}