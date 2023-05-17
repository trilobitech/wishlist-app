import 'package:simple_nav/simple_nav.dart';

export 'package:flutter/material.dart' show RouteFactory;
export 'package:simple_nav/simple_nav.dart' show RouteBuilder, RouteResolver;

export 'page_route.dart';

abstract class RouteModule {
  /// Loads common modules used by more than one defined route.
  Future<void> load() async {}

  /// Retrieves the module's routes.
  Map<String, RouteBuilder> routes() => {};
}
