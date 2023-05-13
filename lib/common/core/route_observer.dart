import 'package:flutter/material.dart';
import 'package:logger_plus/logger_plus.dart';

class GetItRouteObserver extends RouteObserver<ModalRoute<dynamic>> {
  @override
  void didPush(Route route, Route? previousRoute) {
    super.didPush(route, previousRoute);
    Log.d('didPush {route: $route, previousRoute: $previousRoute}');
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    super.didPop(route, previousRoute);
    Log.d('didPop {route: $route, previousRoute: $previousRoute}');
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    Log.d('didReplace {newRoute: $newRoute, oldRoute: $oldRoute}');
  }

  @override
  void didRemove(Route route, Route? previousRoute) {
    super.didRemove(route, previousRoute);
    Log.d('didRemove {route: $route, previousRoute: $previousRoute}');
  }
}
