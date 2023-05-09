import 'dart:async';

import 'package:flutter/material.dart';
import 'package:logger_plus/logger_plus.dart';

import 'app.dart';
import 'di.dart';

void main() async {
  await runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      unawaited(loadModules());

      runApp(const MyApp());
    },
    Log.f,
  );
}
