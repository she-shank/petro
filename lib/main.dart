import 'package:flutter/material.dart';
import 'package:petro/ServiceLocator.dart';
import 'package:petro/services/Router.dart';

void main() {
  setuplocator();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  int _currentindex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      onGenerateRoute: Router.generateRoute,
    );
  }
}

