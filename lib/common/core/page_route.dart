import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:simple_nav/simple_nav.dart';

import 'gambi/scoped_page_route.dart';

typedef PageBuilder<W extends Widget> = W Function(
  BuildContext context,
  RouteExtras extras,
);

typedef RouteSettingsBuilder = RouteSettings Function(
  RouteSettings oldSettings,
);

// RouteBuilder routePageBuilder({
//   required RouteBuilder builder,
//   Function(GetIt)? onInit,
// }) =>
//     (settings, extras) {
//       return PageRouteWrapper(
//         child: builder(settings, extras),
//         init: onInit,
//       );
//     };

RouteBuilder defaultRoutePageBuilder<W extends Widget>({
  required PageBuilder<W> builder,
  RouteSettingsBuilder? settingsBuilder,
  Function(GetIt)? onInit,
  bool maintainState = true,
  bool fullscreenDialog = false,
}) =>
    (settings, extras) {
      return DefaultPageRoute(
        settings: settingsBuilder?.call(settings) ?? settings.copyWith(W),
        builder: (ctx) => builder(ctx, extras),
        onInit: onInit,
        maintainState: maintainState,
        fullscreenDialog: fullscreenDialog,
      );
    };

RouteBuilder genericRoutePageBuilder<R>() {
  // refrectClass(R);
  throw UnimplementedError();
}

class DefaultPageRoute extends MaterialPageRoute
    with ScopedRouteLifecycleMixin {
  DefaultPageRoute({
    required super.builder,
    super.settings,
    super.maintainState = true,
    super.fullscreenDialog = false,
    Function(GetIt container)? onInit,
  }) {
    init = onInit;
  }
}

extension RouteSettingsExt on RouteSettings {
  RouteSettings copyWith(
    Type name, {
    Object? arguments,
  }) =>
      RouteSettings(
        name: name.toString(),
        arguments: arguments ?? this.arguments,
      );
}
