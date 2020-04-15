import 'package:json_annotation/json_annotation.dart';

part 'locations.g.dart';

@JsonSerializable()
class Location {
  /// ISO 3166-1 alpha-2.
  String country;
  String postalCode;

  Location({
    this.country,
    this.postalCode,
  });

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);

  Map<String, dynamic> toJson() => _$LocationToJson(this);
}
