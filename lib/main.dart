import 'package:first_try_null_safety/homepage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        //brightness: Brightness.dark,
        primaryColor: Colors.teal,
        accentColor: Colors.blue,
        primarySwatch: Colors.teal,
        textTheme: const TextTheme(
          headline1: TextStyle(
            fontSize: 20.0,
            fontFamily: 'Hind',
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          headline2: TextStyle(
            fontSize: 16.0,
            fontFamily: 'Hind',
            color: Colors.deepPurple,
            fontStyle: FontStyle.italic,
          ),
        ),
      ),
      home: const HomePage(),
    );
  }
}
