
import 'package:flutter/cupertino.dart';
import 'package:carlibproto/application/router/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Application extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => ApplicationState();
}

class ApplicationState extends State<Application> {

  late GoRouter _config;

  @override
  void initState() {
    _config = GetRouterConfig();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _config,
    );
  }
  
}