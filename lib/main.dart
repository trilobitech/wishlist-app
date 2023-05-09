import 'dart:async';

import 'package:flutter/material.dart';
import 'package:logger_plus/logger_plus.dart';

import 'app.dart';

void main() async {
  await runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      runApp(const MyApp());
    },
    Log.f,
  );
}
