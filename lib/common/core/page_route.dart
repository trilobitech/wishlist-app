import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:logger_plus/logger_plus.dart';
import 'package:meta/meta.dart';
import 'package:simple_nav/simple_nav.dart';

typedef PageBuilder<W extends Widget> = W Function(
  BuildContext context,
  RouteExtras extras,
);

RouteBuilder scopedRoutePageBuilder<W extends Widget>({
  required PageBuilder<W> builder,
  Function(GetIt)? onInit,
  bool maintainState = true,
  bool fullscreenDialog = false,
}) =>
    (settings, extras) => ScopedPageRoute(
          settings: settings.copyWith(name: W.toString()),
          builder: (ctx) => builder(ctx, extras),
          onInit: onInit,
          maintainState: maintainState,
          fullscreenDialog: fullscreenDialog,
        );

class ScopedPageRoute extends MaterialPageRoute with ScopedRouteLifecycleMixin {
  ScopedPageRoute({
    required super.builder,
    super.settings,
    super.maintainState = true,
    super.fullscreenDialog = false,
    Function(GetIt container)? onInit,
  }) {
    init = onInit;
  }
}

mixin ScopedRouteLifecycleMixin on Route {
  String get scopeName => identityHashCode(this).toString();

  @internal
  Function(GetIt container)? init;

  @override
  void install() {
    Log.d('install');
    GetIt.instance.pushNewScope(scopeName: scopeName, init: init);
    super.install();
  }

  @override
  void dispose() {
    Log.d('dispose');
    unawaited(
      GetIt.instance.dropScope(scopeName),
    );
    super.dispose();
  }

  @override
  TickerFuture didPush() {
    Log.d('didPush');
    return super.didPush();
  }

  @override
  bool didPop(result) {
    Log.d('didPop {result: $result}');
    return super.didPop(result);
  }

  @override
  void didReplace(Route? oldRoute) {
    Log.d('didReplace {oldRoute: $oldRoute}');
    super.didReplace(oldRoute);
  }
}
