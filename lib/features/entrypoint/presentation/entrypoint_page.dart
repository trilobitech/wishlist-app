import 'dart:async';

import 'package:flutter/material.dart';
import 'package:logger_plus/logger_plus.dart';
import 'package:state_action_bloc/state_action_bloc.dart';

import 'entrypoint_bloc.dart';

class EntrypointPage extends StatelessWidget
    with ActionMixin<EntrypointBloc, EntrypointAction> {
  const EntrypointPage({super.key});

  @override
  Widget buildWidget(BuildContext context) => SafeArea(
        child: Container(
          color: Theme.of(context).colorScheme.background,
          alignment: Alignment.center,
          child: const CircularProgressIndicator(),
        ),
      );

  @override
  FutureOr handleAction(BuildContext context, EntrypointAction action) async {
    Log.d('Navigating to ${action.destination}');
    await Navigator.of(context).pushReplacementNamed(action.destination);
  }
}
