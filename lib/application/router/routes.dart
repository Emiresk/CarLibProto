import 'package:go_router/go_router.dart';
import '../features/index/FeatureIndex.dart';

GoRouter GetRouterConfig () {

  String _main_location = '/index';
  bool _is_debug = true;

  final List<RouteBase> _routes = [
    GoRoute(
        path: _main_location,
        builder: (context , state) => FeatureIndex()
    ),
  ];

  return GoRouter(
    debugLogDiagnostics: _is_debug,
    initialLocation: _main_location,
    routes: _routes,
  );
}