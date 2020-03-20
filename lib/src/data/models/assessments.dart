import 'package:json_annotation/json_annotation.dart';

part 'assessments.g.dart';

@JsonSerializable()
class Assessment {
  DateTime processed;
  bool matchesPuiSymptoms;

  Assessment({
    this.processed,
    this.matchesPuiSymptoms,
  });

  factory Assessment.fromJson(Map<String, dynamic> json) =>
      _$AssessmentFromJson(json);
  Map<String, dynamic> toJson() => _$AssessmentToJson(this);

  @override
  String toString() =>
      'Assessment { processed: $processed, matchesPuiSymptoms: $matchesPuiSymptoms }';
}
