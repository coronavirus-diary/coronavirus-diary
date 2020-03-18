import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:moor/moor.dart';

import 'package:coronavirus_diary/src/data/database/database.dart';

import 'checkup.dart';

class CheckupBloc extends Bloc<CheckupEvent, CheckupState> {
  final AppDatabase database;

  CheckupBloc({@required this.database});

  @override
  CheckupState get initialState => CheckupStateNotCreated();

  @override
  Stream<CheckupState> mapEventToState(CheckupEvent event) async* {
    switch (event.runtimeType) {
      case AddCheckup:
        yield* _mapAddCheckupToState(event);
        break;
    }
  }

  Stream<CheckupState> _mapAddCheckupToState(AddCheckup event) async* {
    int checkupId = await database.addCheckup(CheckupsCompanion());
    yield* _watchCheckup(checkupId);
  }

  Stream<CheckupState> _watchCheckup(int checkupId) async* {
    Stream<Checkup> stream = database.watchCheckup(checkupId);
    await for (var checkup in stream) {
      yield CheckupStateCreated(checkup);
    }
  }
}
