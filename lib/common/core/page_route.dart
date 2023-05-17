import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:logger_plus/logger_plus.dart';
import 'package:simple_nav/simple_nav.dart';

typedef PageBuilder<W extends Widget> = W Function(
  BuildContext context,
  RouteExtras extras,
);

typedef OnInit = Function(GetIt container);

RouteBuilder scopedRoutePageBuilder<W extends Widget>({
  required PageBuilder<W> builder,
  Function(GetIt)? onInit,
  bool maintainState = true,
  bool fullscreenDialog = false,
}) =>
    (settings, extras) => ScopedPageRoute(
          settings: RouteSettings(name: W.toString(), arguments: extras),
          builder: (ctx) => builder(ctx, extras),
          onInit: onInit,
          maintainState: maintainState,
          fullscreenDialog: fullscreenDialog,
        );

class ScopedPageRoute extends MaterialPageRoute {
  ScopedPageRoute({
    required super.builder,
    super.settings,
    super.maintainState = true,
    super.fullscreenDialog = false,
    OnInit? onInit,
  }) : _init = onInit;

  final OnInit? _init;
  late final String _scopeName = identityHashCode(this).toString();

  @override
  void install() {
    Log.d('${settings.name}: install');
    GetIt.instance.pushNewScope(scopeName: _scopeName, init: _init);
    super.install();
  }

  @override
  void dispose() {
    Log.d('${settings.name}: dispose');
    unawaited(
      GetIt.instance.dropScope(_scopeName),
    );
    super.dispose();
  }

  @override
  TickerFuture didPush() {
    Log.d('${settings.name}: didPush');
    return super.didPush();
  }

  @override
  bool didPop(result) {
    Log.d('${settings.name}: didPop {result: $result}');
    return super.didPop(result);
  }

  @override
  void didReplace(Route? oldRoute) {
    Log.d('${settings.name}: didReplace {oldRoute: $oldRoute}');
    super.didReplace(oldRoute);
  }
}
