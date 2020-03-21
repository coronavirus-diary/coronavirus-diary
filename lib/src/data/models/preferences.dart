import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';
import 'package:uuid/uuid_util.dart';

import 'assessments.dart';

part 'preferences.g.dart';

@JsonSerializable()
class Preferences {
  final String userId;
  final Assessment lastAssessment;
  final bool isFirstLoad;
  final bool consented;

  Preferences({
    userId,
    this.lastAssessment,
    isFirstLoad,
    consented,
  })  : userId = userId ??
            Uuid().v4(
              options: {
                'grng': UuidUtil.cryptoRNG,
              },
            ),
        isFirstLoad = isFirstLoad ?? true,
        consented = consented ?? false;

  Preferences cloneWith({
    Assessment lastAssessment,
  }) {
    return Preferences(
      userId: this.userId,
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
