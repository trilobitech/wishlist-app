import 'package:provider/provider.dart';

import '../../common/core/di.dart';
import '../../common/core/route_module.dart';
import 'presentation/entrypoint_bloc.dart';
import 'presentation/entrypoint_page.dart';

class EntrypointModule extends RouteModule {
  @override
  Map<String, RouteBuilder> routes() => {
        '/': scopedRoutePageBuilder(
          name: 'EntrypointPage',
          builder: (_, __) => MultiProvider(
            providers: [
              DiProvider<EntrypointBloc>(),
            ],
            child: const EntrypointPage(),
          ),
          onInit: _registerDependencies,
        ),
      };
}

void _registerDependencies(GetIt getIt) {
  getIt.registerFactory<EntrypointBloc>(() => EntrypointBloc());
}
