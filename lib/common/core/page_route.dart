import 'dart:async';

import 'package:flutter/material.dart';
import 'package:logger_plus/logger_plus.dart';
import 'package:simple_nav/simple_nav.dart';

import 'di.dart';

typedef PageBuilder<W extends Widget> = W Function(
  BuildContext context,
  RouteExtras extras,
);

typedef OnInit = Function(GetIt container);

RouteBuilder scopedRoutePageBuilder<W extends Widget>({
  String? name,
  required PageBuilder<W> builder,
  OnInit? onInit,
  bool maintainState = true,
  bool fullscreenDialog = false,
}) =>
    (settings, extras) => ScopedPageRoute(
          name: name ?? W.toString(),
          settings: settings,
          builder: (ctx) => builder(ctx, extras),
          onInit: onInit,
          maintainState: maintainState,
          fullscreenDialog: fullscreenDialog,
        );

class ScopedPageRoute extends MaterialPageRoute {
  ScopedPageRoute({
    required this.name,
    required super.builder,
    super.settings,
    super.maintainState = true,
    super.fullscreenDialog = false,
    OnInit? onInit,
  }) : _init = onInit;

  final String name;
  final OnInit? _init;
  late final String _scopeName = identityHashCode(this).toString();

  @override
  void install() {
    Log.d('$name: install');
    getIt.pushNewScope(scopeName: _scopeName, init: _init);
    super.install();
  }

  @override
  void dispose() {
    Log.d('$name: dispose');
    unawaited(getIt.dropScope(_scopeName));
    super.dispose();
  }

  @override
  TickerFuture didPush() {
    Log.d('$name: didPush');
    return super.didPush();
  }

  @override
  bool didPop(result) {
    Log.d('$name: didPop {result: $result}');
    return super.didPop(result);
  }

  @override
  void didReplace(Route? oldRoute) {
    Log.d('$name: didReplace {oldRoute: $oldRoute}');
    super.didReplace(oldRoute);
  }
}
