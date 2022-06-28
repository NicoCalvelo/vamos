import 'package:flutter/material.dart';
import 'package:vamos/Widgets/CreateEvent.dart';
import 'package:vamos/Widgets/NavBar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavBar(),
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 1200, minWidth: 375),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CreateEvenet(),
            ],
          ),
        ),
      ),
    );
  }
}
