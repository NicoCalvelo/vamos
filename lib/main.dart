import 'package:flutter/material.dart';
import 'package:vamos/Pages/Home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vamos',
      theme: ThemeData(
        primaryColor:  const Color.fromRGBO(63, 189, 241, 1),
      ),
      home: const HomePage(),
    );
  }
}

