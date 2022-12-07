import 'package:flutter/material.dart';
import 'package:foodorderinganddelivery/screens/main_screen.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      theme: ThemeData(
      
        primaryColor: Color.fromARGB(255, 240, 170, 19),
      ),
      home: const MainScreen(),
    );
  }
}
