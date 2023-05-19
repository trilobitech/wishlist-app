import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

export 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

T get<T extends Object>() => getIt.get<T>();

class DiProvider<T extends Object> extends Provider<T> {
  DiProvider({super.key, super.child})
      : super(
          create: (context) {
            try {
              return Provider.of<T>(context, listen: false);
            } on ProviderNotFoundException {
              return get<T>();
            }
          },
        );
}
