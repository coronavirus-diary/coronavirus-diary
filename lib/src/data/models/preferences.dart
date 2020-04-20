import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';
import 'package:uuid/uuid_util.dart';

import 'package:covidnearme/src/data/models/local_statistics.dart';
import 'package:covidnearme/src/data/models/locations.dart';

part 'preferences.g.dart';

@JsonSerializable()
class Preferences {
  final String userId;
  final bool completedTutorial;
  final bool acceptedInformedConsent;
  final Location location;
  final List<LocalStatisticsLocation> recentLocalStatisticsLocations;

  Preferences({
    String userId,
    bool completedTutorial,
    this.acceptedInformedConsent,
    Location location,
    List<LocalStatisticsLocation> recentLocalStatisticsLocations,
  })  : userId = userId ??
            Uuid().v4(
              options: {
                'grng': UuidUtil.cryptoRNG,
              },
            ),
        completedTutorial = completedTutorial ?? false,
        location = location ?? Location(country: 'US'),
        recentLocalStatisticsLocations = recentLocalStatisticsLocations ?? [];

  Preferences cloneWith({
    bool completedTutorial,
    bool acceptedInformedConsent,
    Location location,
    List<LocalStatisticsLocation> recentLocalStatisticsLocations,
  }) {
    return Preferences(
      userId: this.userId,
      completedTutorial: completedTutorial ?? this.completedTutorial,
      acceptedInformedConsent:
          acceptedInformedConsent ?? this.acceptedInformedConsent,
      location: location ?? this.location,
      recentLocalStatisticsLocations:
          recentLocalStatisticsLocations ?? this.recentLocalStatisticsLocations,
    );
  }

  factory Preferences.fromJson(Map<String, dynamic> json) =>
      _$PreferencesFromJson(json);
  Map<String, dynamic> toJson() => _$PreferencesToJson(this);

  @override
  String toString() =>
      'Preferences { userId: $userId, acceptedInformedConsent: $acceptedInformedConsent, location: $location }';
}
