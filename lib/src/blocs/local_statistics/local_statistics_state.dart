import 'package:covidnearme/src/data/models/local_statistics.dart';

abstract class LocalStatisticsState {
  const LocalStatisticsState();
}

class LocalStatisticsNotLoaded extends LocalStatisticsState {
  const LocalStatisticsNotLoaded();
}

class LocalStatisticsLoading extends LocalStatisticsState {
  const LocalStatisticsLoading();
}

class LocalStatisticsError extends LocalStatisticsState {
  const LocalStatisticsError();
}

class LocalStatisticsLoaded extends LocalStatisticsState {
  final List<LocalStatisticsEntry> localStatisticsEntries;

  const LocalStatisticsLoaded({this.localStatisticsEntries});
}
