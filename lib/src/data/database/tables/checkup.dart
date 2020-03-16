import 'dart:convert';

import 'package:moor/moor.dart';

import 'package:coronavirus_diary/src/data/models/subjective_questions.dart';
import 'package:coronavirus_diary/src/data/models/vitals.dart';

class Checkups extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get created => dateTime().withDefault(currentDateAndTime)();

  // Location
  IntColumn get location =>
      integer().nullable().customConstraint('NULL REFERENCES locations(id)')();

  // Subjective questions
  TextColumn get subjectiveQuestions =>
      text().map(const SubjectiveQuestionsConverter()).nullable()();

  // Vitals
  TextColumn get vitals => text().map(const VitalsConverter()).nullable()();

  // Assessment
  TextColumn get assessment => text().nullable()();
}

class SubjectiveQuestionsConverter
    extends TypeConverter<SubjectiveQuestions, String> {
  const SubjectiveQuestionsConverter();

  @override
  SubjectiveQuestions mapToDart(String fromDb) {
    if (fromDb == null) {
      return null;
    }
    return SubjectiveQuestions.fromJson(
        json.decode(fromDb) as Map<String, dynamic>);
  }

  @override
  String mapToSql(SubjectiveQuestions value) {
    if (value == null) {
      return null;
    }

    return json.encode(value.toJson());
  }
}

class VitalsConverter extends TypeConverter<Vitals, String> {
  const VitalsConverter();

  @override
  Vitals mapToDart(String fromDb) {
    if (fromDb == null) {
      return null;
    }
    return Vitals.fromJson(json.decode(fromDb) as Map<String, dynamic>);
  }

  @override
  String mapToSql(Vitals value) {
    if (value == null) {
      return null;
    }

    return json.encode(value.toJson());
  }
}
