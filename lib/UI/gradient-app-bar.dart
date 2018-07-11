import "package:flutter/material.dart";

class GradientAppBar extends StatelessWidget {
  
  final String _title;
  final double barHeight = 60.0;

  GradientAppBar(this._title);
  
  @override
  Widget build(BuildContext context) {
    final double statusbarHeight = MediaQuery
      .of(context).padding.top;

    return Container(
      padding: EdgeInsets.only(top: statusbarHeight),
      height: statusbarHeight + barHeight,
      child: Center(
        child: Text(_title, style: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold))
      ),
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
    );
  }
}