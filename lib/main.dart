import "package:flutter/material.dart";
import 'package:food_app/pages/contact_page.dart';
import 'package:food_app/pages/donate_page.dart';
import 'package:food_app/pages/shopping_list_page.dart';
import "./pages/home_page.dart";

void main () => runApp(MaterialApp(
  home: MainApp(),
  theme: ThemeData(
    primaryColor: Colors.orangeAccent,
  ),
));

class MainApp extends StatefulWidget {
  @override
  MainAppState createState() => MainAppState();
}

class MainAppState extends State<MainApp> {
  int i = 0;
  var pages = [
    HomePage(),
    ShoppingListPage(),
    DonatePage(),
    ContactPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[i],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.local_dining),
            title: Text("Home")
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            title: Text("Shopping lists")
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_atm),
            title: Text("Donate")
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contact_mail),
            title: Text("Contact")
          ),
        ],
        currentIndex: i,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            i = index;
          });
        }
      )
    );
  }
}