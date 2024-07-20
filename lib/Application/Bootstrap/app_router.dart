import 'package:carlibproto/Application/Pages/PageStart/page_start.dart';
import 'package:carlibproto/Application/Pages/PageSettings/page_settings.dart';
import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';



GoRouter getAppRouterConfiguration () {

  String _base_location = '/';
  bool _debug_is_enabled = true;

  List<RouteBase> _routes = [
    GoRoute(
      path: '/',
      builder: (context, state) => PageStart(),
    ),

    GoRoute(
      path: '/start',
      builder: (context, state) => PageStart(),
    ),

    GoRoute(
      path: '/settings',
      builder: (context, state) => PageSettings(),
    ),
  ];

  return GoRouter(
    initialLocation: _base_location,
    debugLogDiagnostics: _debug_is_enabled,
    routes: _routes,
  );
}