import 'package:flutter/material.dart';

import 'common/style/theme.dart';
import 'router.dart';

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
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
      onGenerateRoute: routerDelegate(),
    );
  }
}
