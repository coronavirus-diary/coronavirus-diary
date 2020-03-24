import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

/// An implementation of [HydratedBlocDelegate] that forwards exceptions to
/// [FlutterError.onError];
class AppHydratedBlocDelegate extends HydratedBlocDelegate {
  AppHydratedBlocDelegate(HydratedStorage storage) : super(storage);

  static Future<HydratedBlocDelegate> build({
    Directory storageDirectory,
  }) async {
    return AppHydratedBlocDelegate(
      await HydratedBlocStorage.getInstance(storageDirectory: storageDirectory),
    );
  }

  @override
  void onError(Bloc bloc, Object error, StackTrace stacktrace) {
    FlutterError.onError(FlutterErrorDetails(
      exception: error,
      stack: stacktrace,
      context: DiagnosticsNode.message('In Bloc $bloc'),
    ));
    super.onError(bloc, error, stacktrace);
  }
}
