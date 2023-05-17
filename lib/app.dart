import 'package:flutter/material.dart';

import 'common/style/theme.dart';

class App extends StatelessWidget {
  const App({
    super.key,
    required this.routeDelegate,
  });

  final RouteFactory Function() routeDelegate;

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
    );
  }
}
