import 'package:json_annotation/json_annotation.dart';

part 'checkups.g.dart';

@JsonSerializable()
class Checkup {
  String id;
  DateTime created;
  bool dataContributionPreference;
  List<SubjectiveQuestionResponse> subjectiveResponses;
  List<VitalsResponse> vitalsResponses;

  Checkup({
    this.id,
    this.created,
    dataContributionPreference,
    subjectiveResponses,
    vitalsResponses,
  })  : dataContributionPreference = dataContributionPreference ?? true,
        subjectiveResponses = subjectiveResponses ?? [],
        vitalsResponses = vitalsResponses ?? [];

  factory Checkup.fromJson(Map<String, dynamic> json) =>
      _$CheckupFromJson(json);
  Map<String, dynamic> toJson() => _$CheckupToJson(this);

  @override
  String toString() =>
      'Checkup { id: $id, created: $created, dataContributionPreference: $dataContributionPreference, subjectiveResponses: $subjectiveResponses, vitalsResponses: $vitalsResponses }';
}

@JsonSerializable()
class SubjectiveQuestionResponse {
  final String id;
  dynamic response;

  SubjectiveQuestionResponse({
    this.id,
    this.response,
  });

  factory SubjectiveQuestionResponse.fromJson(Map<String, dynamic> json) =>
      _$SubjectiveQuestionResponseFromJson(json);
  Map<String, dynamic> toJson() => _$SubjectiveQuestionResponseToJson(this);

  @override
  String toString() =>
      'SubjectiveQuestionResponse { id: $id, response: $response }';
}

@JsonSerializable()
class VitalsResponse {
  final String id;
  String response;
  String dataSource;

  VitalsResponse({
    this.id,
    this.response,
    this.dataSource,
  });

  factory VitalsResponse.fromJson(Map<String, dynamic> json) =>
      _$VitalsResponseFromJson(json);
  Map<String, dynamic> toJson() => _$VitalsResponseToJson(this);

  @override
  String toString() =>
      'VitalsResponse { id: $id, response: $response, dataSource: $dataSource }';
}
