import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class LocalStatisticsEvent extends Equatable {
  const LocalStatisticsEvent();

  @override
  List<Object> get props => [];

  @override
  bool get stringify => true;
}

class GetLocalStatistics extends LocalStatisticsEvent {
  final String country;
  final String zip;

  const GetLocalStatistics({
    @required this.country,
    this.zip,
  });
}
