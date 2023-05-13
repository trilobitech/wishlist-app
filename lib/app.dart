import 'package:flutter/material.dart';

import 'common/core/route_observer.dart';
import 'common/style/theme.dart';

class App extends StatelessWidget {
  App({
    super.key,
    required this.routeDelegate,
  });

  final RouteFactory Function() routeDelegate;

  late final navigatorObservers = <NavigatorObserver>[
    GetItRouteObserver(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wishlist',

      // define theme
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      themeMode: ThemeMode.system,

      // define routes
      initialRoute: '/',
      onGenerateRoute: routeDelegate(),
      navigatorObservers: navigatorObservers,
    );
  }
}
