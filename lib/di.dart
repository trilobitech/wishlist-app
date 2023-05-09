import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> loadModules() async {
  // load modules here
  await getIt.allReady();
}
