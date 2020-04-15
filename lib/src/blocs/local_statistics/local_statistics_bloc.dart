import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import 'package:covidnearme/src/blocs/preferences/preferences.dart';
import 'package:covidnearme/src/data/models/local_statistics.dart';
import 'package:covidnearme/src/data/repositories/local_statistics.dart';
import 'local_statistics.dart';

export 'package:covidnearme/src/data/repositories/local_statistics.dart';
export 'package:covidnearme/src/data/models/local_statistics.dart';

class LocalStatisticsBloc
    extends Bloc<LocalStatisticsEvent, LocalStatisticsState> {
  final PreferencesState preferencesState;
  final LocalStatisticsRepository localStatisticsRepository;

  LocalStatisticsBloc({
    @required this.preferencesState,
    @required this.localStatisticsRepository,
  });

  @override
  LocalStatisticsState get initialState => const LocalStatisticsNotLoaded();

  @override
  Stream<LocalStatisticsState> mapEventToState(
      LocalStatisticsEvent event) async* {
    switch (event.runtimeType) {
      case GetLocalStatistics:
        yield* _mapGetLocalStatisticsToState(event);
        break;
    }
  }

  Stream<LocalStatisticsState> _mapGetLocalStatisticsToState(
      GetLocalStatistics event) async* {
    yield const LocalStatisticsLoading();

    // Fetch local statistics
    List<LocalStatisticsEntry> localStatisticsEntries =
        await localStatisticsRepository.getLocalStatistics(
      country: event.country,
      zip: event.zip,
    );

    yield LocalStatisticsLoaded(localStatisticsEntries: localStatisticsEntries);
  }
}
