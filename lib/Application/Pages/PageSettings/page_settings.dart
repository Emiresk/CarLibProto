import 'package:flutter/material.dart';

class PageSettings extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PageSettingsStateComponent();
}

class PageSettingsStateComponent extends State<PageSettings> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold (
          body: Text ('Hello from PageSettings page'),
        )
    );
  }

}