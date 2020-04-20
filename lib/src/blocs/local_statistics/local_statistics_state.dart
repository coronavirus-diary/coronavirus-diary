import 'package:covidnearme/src/data/models/local_statistics.dart';
import 'package:covidnearme/src/data/models/locations.dart';

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
  final LocalStatisticsResponse localStatisticsResponse;
  final Location location;

  const LocalStatisticsError({
    this.localStatisticsResponse,
    this.location,
  });
}

class LocalStatisticsLoaded extends LocalStatisticsState {
  final LocalStatisticsResponse localStatisticsResponse;

  const LocalStatisticsLoaded({this.localStatisticsResponse});
}
