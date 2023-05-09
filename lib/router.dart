import 'package:flutter/material.dart';
import 'package:simple_nav/simple_nav.dart';

import 'features/home/home_page.dart';

RouteFactory routerDelegate() => RouteResolver(routes);

final routes = <String, RouteBuilder>{
  '/': (settings, _) {
    return MaterialPageRoute(
      settings: const RouteSettings(name: 'HomePage'),
      builder: (_) => const HomePage(title: 'Wishlist'),
    );
  },
};
