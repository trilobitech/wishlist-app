import 'common/core/route_module.dart';
import 'features/entrypoint/entrypoint_module.dart';
import 'features/home/home_module.dart';

class MainRouteModule extends RouteModule {
  /// The list of child modules.
  late final List<RouteModule> children = [
    EntrypointModule(),
    HomeRouteModule(),
  ];

  @override
  Future<void> load() async {
    await Future.wait(
      children.map((child) => child.load()),
    );
  }

  /// Retrieves the module's route factory.
  RouteFactory routeFactory() {
    final childrenRoutes = children.expand((child) => child.routes().entries);

    final routes = {
      ...this.routes(),
      ...Map.fromEntries(childrenRoutes),
    };

    return RouteResolver(routes);
  }
}
