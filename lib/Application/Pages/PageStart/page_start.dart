import 'package:flutter/material.dart';

class PageStart extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PageStartStateComponent();
}

class PageStartStateComponent extends State<PageStart> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold (
          body: Text ('Hello from Start page'),
        )
    );
  }

}