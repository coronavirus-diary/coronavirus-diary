import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';
import 'package:uuid/uuid_util.dart';

import 'assessments.dart';

part 'preferences.g.dart';

@JsonSerializable()
class Preferences {
  final String userId;
  final bool completedTutorial;
  final bool agreedToTerms;
  final Assessment lastAssessment;

  Preferences({
    String userId,
    completedTutorial,
    this.agreedToTerms,
    this.lastAssessment,
  })  : completedTutorial = completedTutorial ?? false,
        userId = userId ??
            Uuid().v4(
              options: {
                'grng': UuidUtil.cryptoRNG,
              },
            );

  Preferences cloneWith({
    bool completedTutorial,
    bool agreedToTerms,
    Assessment lastAssessment,
  }) {
    return Preferences(
      userId: this.userId,
      completedTutorial: completedTutorial ?? this.completedTutorial,
      agreedToTerms: agreedToTerms ?? this.agreedToTerms,
      lastAssessment: lastAssessment ?? this.lastAssessment,
    );
  }

  factory Preferences.fromJson(Map<String, dynamic> json) =>
      _$PreferencesFromJson(json);
  Map<String, dynamic> toJson() => _$PreferencesToJson(this);

  @override
  String toString() =>
      'Preferences { userId: $userId, lastAssessment: $lastAssessment }';
}
