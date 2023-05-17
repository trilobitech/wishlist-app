import '../../common/core/route_module.dart';
import 'home_page.dart';

class HomeRouteModule extends RouteModule {
  @override
  Map<String, RouteBuilder> routes() => {
        '/': scopedRoutePageBuilder(
          builder: (_, __) => const HomePage(title: 'Wishlist'),
        ),
      };
}
