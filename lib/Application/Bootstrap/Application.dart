import 'package:flutter/material.dart';

class Application extends StatefulWidget {
  const Application({super.key});
  @override
  State<StatefulWidget> createState() => ApplicationStateComponent();
}

class ApplicationStateComponent extends State<Application> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text ('Hello'),
        ),
      ),
    );
  }
}