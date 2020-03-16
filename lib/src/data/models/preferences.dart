import 'package:json_annotation/json_annotation.dart';

part 'preferences.g.dart';

@JsonSerializable()
class Preferences {
  bool trackLocation;

  Preferences({
    this.trackLocation = false,
  });

  Preferences.clone(Preferences preferences)
      : this(
          trackLocation: preferences.trackLocation,
        );

  factory Preferences.fromJson(Map<String, dynamic> json) =>
      _$PreferencesFromJson(json);
  Map<String, dynamic> toJson() => _$PreferencesToJson(this);
}
