import 'dart:async';

import 'package:covidnearme/src/blocs/utils.dart';
import 'package:file/memory.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test/test.dart';

void main() {
  test('AppHydratedBlocDelegate forwards errors to FlutterError.onError',
      () async {
    BlocSupervisor.delegate = await AppHydratedBlocDelegate.build(
        storageDirectory: MemoryFileSystem.test().currentDirectory);

    final onErrorCompleter = Completer<FlutterErrorDetails>();
    FlutterError.onError = onErrorCompleter.complete;
    BadBloc().add(null);

    expect(
        await onErrorCompleter.future,
        isA<FlutterErrorDetails>()
          ..having((d) => d.exception, 'exception', contains('Hello there')));
  });
}

class BadBloc extends Bloc<void, void> {
  @override
  void get initialState => null;

  @override
  Stream<void> mapEventToState(void event) async* {
    throw Exception('Hello There');
  }
}
