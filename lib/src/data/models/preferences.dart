import 'package:covidnearme/src/data/models/symptom_report.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';
import 'package:uuid/uuid_util.dart';

part 'preferences.g.dart';

@JsonSerializable()
class Preferences {
  final String userId;
  final bool completedTutorial;
  final bool acceptedInformedConsent;
  final UserLocation location;

  Preferences({
    String userId,
    bool completedTutorial,
    this.acceptedInformedConsent,
    this.location,
  })  : completedTutorial = completedTutorial ?? false,
        userId = userId ??
            Uuid().v4(
              options: {
                'grng': UuidUtil.cryptoRNG,
              },
            );

  Preferences cloneWith({
    bool completedTutorial,
    bool acceptedInformedConsent,
    UserLocation location,
  }) {
    return Preferences(
      userId: this.userId,
      completedTutorial: completedTutorial ?? this.completedTutorial,
      acceptedInformedConsent:
          acceptedInformedConsent ?? this.acceptedInformedConsent,
      location: location ?? this.location,
    );
  }

  factory Preferences.fromJson(Map<String, dynamic> json) =>
      _$PreferencesFromJson(json);
  Map<String, dynamic> toJson() => _$PreferencesToJson(this);

  @override
  String toString() =>
      'Preferences { userId: $userId, acceptedInformedConsent: $acceptedInformedConsent, location: $location }';
}
