import 'package:carlibproto/Application/Bootstrap/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Application extends StatefulWidget {
  const Application({super.key});
  @override
  State<StatefulWidget> createState() => ApplicationStateComponent();
}

class ApplicationStateComponent extends State<Application> {

  bool _test_mode_state = true;
  late GoRouter routerConfig;

  @override
  void initState() {
    super.initState();

    print( "[Log] Application inited" );

    routerConfig = getAppRouterConfiguration();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: _test_mode_state,
      routerConfig: routerConfig,
    );
  }
}