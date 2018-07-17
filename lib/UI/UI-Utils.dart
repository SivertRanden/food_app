import "package:flutter/material.dart";

class UIUtils {

  static BoxDecoration getDecoration(BuildContext context) {
    return BoxDecoration(
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
    );
  }
}

