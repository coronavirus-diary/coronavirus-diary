import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'package:covidnearme/src/data/models/locations.dart';

abstract class LocalStatisticsEvent extends Equatable {
  const LocalStatisticsEvent();

  @override
  List<Object> get props => [];

  @override
  bool get stringify => true;
}

class GetLocalStatistics extends LocalStatisticsEvent {
  final Location location;

  const GetLocalStatistics({@required this.location});
}
