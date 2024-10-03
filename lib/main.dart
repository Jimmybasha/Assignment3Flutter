import 'package:flutter/material.dart';
import 'package:flutter_sessionthree/Assignment2Part2/HomeScreen.dart';
import 'package:flutter_sessionthree/Assignment2Part2/NavigationScreen/AndroidScreen.dart';
import 'package:flutter_sessionthree/Assignment2Part2/NavigationScreen/IosScreen.dart';
import 'package:flutter_sessionthree/Assignment3/ContactsScreen.dart';
import 'package:flutter_sessionthree/XO%20Game/board_screen.dart';
import 'package:flutter_sessionthree/calculator_screen.dart';

import 'Assignment2Part2/NavigationScreen/FullStackScreen.dart';
import 'XO Game/home_screen.dart';


void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  Map<String,Widget Function(BuildContext)> screenRoutes={

    CalculatorScreen.routeName:(_)=>CalculatorScreen(),
    HomeScreen.routeName:(_)=>HomeScreen(),
    BoardScreen.routeName:(_)=>BoardScreen(),
    Homescreen.routeName:(_)=>Homescreen(),
    Androidscreen.routeName:(_)=>Androidscreen(),
    IosScreen.routeName:(_)=>IosScreen(),
    FullStackScreen.routeName:(_)=>FullStackScreen(),
    ContactsScreen.routeName:(_)=>ContactsScreen()

  };

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      routes:screenRoutes ,
      initialRoute:ContactsScreen.routeName,
    );
  }

}
