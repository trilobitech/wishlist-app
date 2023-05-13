import 'package:logger_plus/logger_plus.dart';

import '../../common/core/route_module.dart';
import 'home_page.dart';

class HomeRouteModule extends RouteModule {
  @override
  Map<String, RouteBuilder> routes() => {
        '/0': (settings, _) {
          Log.d('HomePage');
          return DefaultPageRoute(
            settings: settings.copyWith(HomePage),
            builder: (_) => const HomePage(title: 'Wishlist'),
            onInit: (container) {
              Log.d('onInit');
            },
          );
        },
        '/': defaultRoutePageBuilder(
          builder: (_, __) => const HomePage(title: 'Wishlist'),
          onInit: (container) {
            Log.d('onInit');
          },
        ),
      };
}
