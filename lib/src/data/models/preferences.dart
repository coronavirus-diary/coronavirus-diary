import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';
import 'package:uuid/uuid_util.dart';

part 'preferences.g.dart';

@JsonSerializable()
class Preferences {
  final String userId;

  Preferences({
    userId,
  }) : userId = userId ??
            Uuid().v4(options: {
              'grng': UuidUtil.cryptoRNG,
            });

  Preferences.clone(Preferences preferences)
      : this(
          userId: preferences.userId,
        );

  factory Preferences.fromJson(Map<String, dynamic> json) =>
      _$PreferencesFromJson(json);
  Map<String, dynamic> toJson() => _$PreferencesToJson(this);
}
