import 'dart:async';

import 'package:logger_plus/logger_plus.dart';
import 'package:state_action_bloc/state_action_bloc.dart';

class EntrypointBloc extends ActionBloc<EntrypointAction> {
  EntrypointBloc() : super();

  @override
  FutureOr<void> load() async {
    await Future.delayed(const Duration(milliseconds: 100));
    Log.d('Sending action to navigate to /my-lists');
    sendAction(const EntrypointAction('/my-lists'));
  }
}

class EntrypointAction implements IAction {
  const EntrypointAction(this.destination);

  final String destination;
}
