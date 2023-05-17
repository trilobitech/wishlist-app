import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:logger_plus/logger_plus.dart';
import 'package:logging/logging.dart';

import 'app.dart';
import 'module.dart';

void main() async {
  initLogger();

  await runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      final mainModule = MainRouteModule();
      await mainModule.load();

      final app = App(
        routeDelegate: mainModule.routeFactory,
      );

      runApp(app);
    },
    Log.wtf,
  );
}

void initLogger() {
  if (kDebugMode) {
    Logger.root.level = Level.ALL;
    Log.listen(DebugLogRecorder());
  }
}
