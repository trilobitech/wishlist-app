import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:logger_plus/logger_plus.dart';

import 'app.dart';
import 'module.dart';

void main() async {
  if (kDebugMode) {
    Log.listen(DebugLogRecorder());
  }

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
