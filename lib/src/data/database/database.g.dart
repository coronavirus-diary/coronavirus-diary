// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Activity extends DataClass implements Insertable<Activity> {
  final int id;
  final DateTime created;
  final int locationId;
  final String participants;
  Activity(
      {@required this.id,
      @required this.created,
      this.locationId,
      this.participants});
  factory Activity.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    final stringType = db.typeSystem.forDartType<String>();
    return Activity(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      created: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}created']),
      locationId: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}location_id']),
      participants: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}participants']),
    );
  }
  factory Activity.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Activity(
      id: serializer.fromJson<int>(json['id']),
      created: serializer.fromJson<DateTime>(json['created']),
      locationId: serializer.fromJson<int>(json['locationId']),
      participants: serializer.fromJson<String>(json['participants']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'created': serializer.toJson<DateTime>(created),
      'locationId': serializer.toJson<int>(locationId),
      'participants': serializer.toJson<String>(participants),
    };
  }

  @override
  ActivitiesCompanion createCompanion(bool nullToAbsent) {
    return ActivitiesCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      created: created == null && nullToAbsent
          ? const Value.absent()
          : Value(created),
      locationId: locationId == null && nullToAbsent
          ? const Value.absent()
          : Value(locationId),
      participants: participants == null && nullToAbsent
          ? const Value.absent()
          : Value(participants),
    );
  }

  Activity copyWith(
          {int id, DateTime created, int locationId, String participants}) =>
      Activity(
        id: id ?? this.id,
        created: created ?? this.created,
        locationId: locationId ?? this.locationId,
        participants: participants ?? this.participants,
      );
  @override
  String toString() {
    return (StringBuffer('Activity(')
          ..write('id: $id, ')
          ..write('created: $created, ')
          ..write('locationId: $locationId, ')
          ..write('participants: $participants')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(created.hashCode,
          $mrjc(locationId.hashCode, participants.hashCode))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Activity &&
          other.id == this.id &&
          other.created == this.created &&
          other.locationId == this.locationId &&
          other.participants == this.participants);
}

class ActivitiesCompanion extends UpdateCompanion<Activity> {
  final Value<int> id;
  final Value<DateTime> created;
  final Value<int> locationId;
  final Value<String> participants;
  const ActivitiesCompanion({
    this.id = const Value.absent(),
    this.created = const Value.absent(),
    this.locationId = const Value.absent(),
    this.participants = const Value.absent(),
  });
  ActivitiesCompanion.insert({
    this.id = const Value.absent(),
    this.created = const Value.absent(),
    this.locationId = const Value.absent(),
    this.participants = const Value.absent(),
  });
  ActivitiesCompanion copyWith(
      {Value<int> id,
      Value<DateTime> created,
      Value<int> locationId,
      Value<String> participants}) {
    return ActivitiesCompanion(
      id: id ?? this.id,
      created: created ?? this.created,
      locationId: locationId ?? this.locationId,
      participants: participants ?? this.participants,
    );
  }
}

class $ActivitiesTable extends Activities
    with TableInfo<$ActivitiesTable, Activity> {
  final GeneratedDatabase _db;
  final String _alias;
  $ActivitiesTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _createdMeta = const VerificationMeta('created');
  GeneratedDateTimeColumn _created;
  @override
  GeneratedDateTimeColumn get created => _created ??= _constructCreated();
  GeneratedDateTimeColumn _constructCreated() {
    return GeneratedDateTimeColumn('created', $tableName, false,
        defaultValue: currentDateAndTime);
  }

  final VerificationMeta _locationIdMeta = const VerificationMeta('locationId');
  GeneratedIntColumn _locationId;
  @override
  GeneratedIntColumn get locationId => _locationId ??= _constructLocationId();
  GeneratedIntColumn _constructLocationId() {
    return GeneratedIntColumn('location_id', $tableName, true,
        $customConstraints: 'NULL REFERENCES locations(id)');
  }

  final VerificationMeta _participantsMeta =
      const VerificationMeta('participants');
  GeneratedTextColumn _participants;
  @override
  GeneratedTextColumn get participants =>
      _participants ??= _constructParticipants();
  GeneratedTextColumn _constructParticipants() {
    return GeneratedTextColumn(
      'participants',
      $tableName,
      true,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, created, locationId, participants];
  @override
  $ActivitiesTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'activities';
  @override
  final String actualTableName = 'activities';
  @override
  VerificationContext validateIntegrity(ActivitiesCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    }
    if (d.created.present) {
      context.handle(_createdMeta,
          created.isAcceptableValue(d.created.value, _createdMeta));
    }
    if (d.locationId.present) {
      context.handle(_locationIdMeta,
          locationId.isAcceptableValue(d.locationId.value, _locationIdMeta));
    }
    if (d.participants.present) {
      context.handle(
          _participantsMeta,
          participants.isAcceptableValue(
              d.participants.value, _participantsMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Activity map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Activity.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(ActivitiesCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<int, IntType>(d.id.value);
    }
    if (d.created.present) {
      map['created'] = Variable<DateTime, DateTimeType>(d.created.value);
    }
    if (d.locationId.present) {
      map['location_id'] = Variable<int, IntType>(d.locationId.value);
    }
    if (d.participants.present) {
      map['participants'] = Variable<String, StringType>(d.participants.value);
    }
    return map;
  }

  @override
  $ActivitiesTable createAlias(String alias) {
    return $ActivitiesTable(_db, alias);
  }
}

class Checkup extends DataClass implements Insertable<Checkup> {
  final int id;
  final DateTime created;
  final int locationId;
  final SubjectiveQuestions subjectiveQuestions;
  final Vitals vitals;
  final String assessment;
  Checkup(
      {@required this.id,
      @required this.created,
      this.locationId,
      this.subjectiveQuestions,
      this.vitals,
      this.assessment});
  factory Checkup.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    final stringType = db.typeSystem.forDartType<String>();
    return Checkup(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      created: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}created']),
      locationId: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}location_id']),
      subjectiveQuestions: $CheckupsTable.$converter0.mapToDart(
          stringType.mapFromDatabaseResponse(
              data['${effectivePrefix}subjective_questions'])),
      vitals: $CheckupsTable.$converter1.mapToDart(
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}vitals'])),
      assessment: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}assessment']),
    );
  }
  factory Checkup.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Checkup(
      id: serializer.fromJson<int>(json['id']),
      created: serializer.fromJson<DateTime>(json['created']),
      locationId: serializer.fromJson<int>(json['locationId']),
      subjectiveQuestions:
          serializer.fromJson<SubjectiveQuestions>(json['subjectiveQuestions']),
      vitals: serializer.fromJson<Vitals>(json['vitals']),
      assessment: serializer.fromJson<String>(json['assessment']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'created': serializer.toJson<DateTime>(created),
      'locationId': serializer.toJson<int>(locationId),
      'subjectiveQuestions':
          serializer.toJson<SubjectiveQuestions>(subjectiveQuestions),
      'vitals': serializer.toJson<Vitals>(vitals),
      'assessment': serializer.toJson<String>(assessment),
    };
  }

  @override
  CheckupsCompanion createCompanion(bool nullToAbsent) {
    return CheckupsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      created: created == null && nullToAbsent
          ? const Value.absent()
          : Value(created),
      locationId: locationId == null && nullToAbsent
          ? const Value.absent()
          : Value(locationId),
      subjectiveQuestions: subjectiveQuestions == null && nullToAbsent
          ? const Value.absent()
          : Value(subjectiveQuestions),
      vitals:
          vitals == null && nullToAbsent ? const Value.absent() : Value(vitals),
      assessment: assessment == null && nullToAbsent
          ? const Value.absent()
          : Value(assessment),
    );
  }

  Checkup copyWith(
          {int id,
          DateTime created,
          int locationId,
          SubjectiveQuestions subjectiveQuestions,
          Vitals vitals,
          String assessment}) =>
      Checkup(
        id: id ?? this.id,
        created: created ?? this.created,
        locationId: locationId ?? this.locationId,
        subjectiveQuestions: subjectiveQuestions ?? this.subjectiveQuestions,
        vitals: vitals ?? this.vitals,
        assessment: assessment ?? this.assessment,
      );
  @override
  String toString() {
    return (StringBuffer('Checkup(')
          ..write('id: $id, ')
          ..write('created: $created, ')
          ..write('locationId: $locationId, ')
          ..write('subjectiveQuestions: $subjectiveQuestions, ')
          ..write('vitals: $vitals, ')
          ..write('assessment: $assessment')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          created.hashCode,
          $mrjc(
              locationId.hashCode,
              $mrjc(subjectiveQuestions.hashCode,
                  $mrjc(vitals.hashCode, assessment.hashCode))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Checkup &&
          other.id == this.id &&
          other.created == this.created &&
          other.locationId == this.locationId &&
          other.subjectiveQuestions == this.subjectiveQuestions &&
          other.vitals == this.vitals &&
          other.assessment == this.assessment);
}

class CheckupsCompanion extends UpdateCompanion<Checkup> {
  final Value<int> id;
  final Value<DateTime> created;
  final Value<int> locationId;
  final Value<SubjectiveQuestions> subjectiveQuestions;
  final Value<Vitals> vitals;
  final Value<String> assessment;
  const CheckupsCompanion({
    this.id = const Value.absent(),
    this.created = const Value.absent(),
    this.locationId = const Value.absent(),
    this.subjectiveQuestions = const Value.absent(),
    this.vitals = const Value.absent(),
    this.assessment = const Value.absent(),
  });
  CheckupsCompanion.insert({
    this.id = const Value.absent(),
    this.created = const Value.absent(),
    this.locationId = const Value.absent(),
    this.subjectiveQuestions = const Value.absent(),
    this.vitals = const Value.absent(),
    this.assessment = const Value.absent(),
  });
  CheckupsCompanion copyWith(
      {Value<int> id,
      Value<DateTime> created,
      Value<int> locationId,
      Value<SubjectiveQuestions> subjectiveQuestions,
      Value<Vitals> vitals,
      Value<String> assessment}) {
    return CheckupsCompanion(
      id: id ?? this.id,
      created: created ?? this.created,
      locationId: locationId ?? this.locationId,
      subjectiveQuestions: subjectiveQuestions ?? this.subjectiveQuestions,
      vitals: vitals ?? this.vitals,
      assessment: assessment ?? this.assessment,
    );
  }
}

class $CheckupsTable extends Checkups with TableInfo<$CheckupsTable, Checkup> {
  final GeneratedDatabase _db;
  final String _alias;
  $CheckupsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _createdMeta = const VerificationMeta('created');
  GeneratedDateTimeColumn _created;
  @override
  GeneratedDateTimeColumn get created => _created ??= _constructCreated();
  GeneratedDateTimeColumn _constructCreated() {
    return GeneratedDateTimeColumn('created', $tableName, false,
        defaultValue: currentDateAndTime);
  }

  final VerificationMeta _locationIdMeta = const VerificationMeta('locationId');
  GeneratedIntColumn _locationId;
  @override
  GeneratedIntColumn get locationId => _locationId ??= _constructLocationId();
  GeneratedIntColumn _constructLocationId() {
    return GeneratedIntColumn('location_id', $tableName, true,
        $customConstraints: 'NULL REFERENCES locations(id)');
  }

  final VerificationMeta _subjectiveQuestionsMeta =
      const VerificationMeta('subjectiveQuestions');
  GeneratedTextColumn _subjectiveQuestions;
  @override
  GeneratedTextColumn get subjectiveQuestions =>
      _subjectiveQuestions ??= _constructSubjectiveQuestions();
  GeneratedTextColumn _constructSubjectiveQuestions() {
    return GeneratedTextColumn(
      'subjective_questions',
      $tableName,
      true,
    );
  }

  final VerificationMeta _vitalsMeta = const VerificationMeta('vitals');
  GeneratedTextColumn _vitals;
  @override
  GeneratedTextColumn get vitals => _vitals ??= _constructVitals();
  GeneratedTextColumn _constructVitals() {
    return GeneratedTextColumn(
      'vitals',
      $tableName,
      true,
    );
  }

  final VerificationMeta _assessmentMeta = const VerificationMeta('assessment');
  GeneratedTextColumn _assessment;
  @override
  GeneratedTextColumn get assessment => _assessment ??= _constructAssessment();
  GeneratedTextColumn _constructAssessment() {
    return GeneratedTextColumn(
      'assessment',
      $tableName,
      true,
    );
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, created, locationId, subjectiveQuestions, vitals, assessment];
  @override
  $CheckupsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'checkups';
  @override
  final String actualTableName = 'checkups';
  @override
  VerificationContext validateIntegrity(CheckupsCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    }
    if (d.created.present) {
      context.handle(_createdMeta,
          created.isAcceptableValue(d.created.value, _createdMeta));
    }
    if (d.locationId.present) {
      context.handle(_locationIdMeta,
          locationId.isAcceptableValue(d.locationId.value, _locationIdMeta));
    }
    context.handle(
        _subjectiveQuestionsMeta, const VerificationResult.success());
    context.handle(_vitalsMeta, const VerificationResult.success());
    if (d.assessment.present) {
      context.handle(_assessmentMeta,
          assessment.isAcceptableValue(d.assessment.value, _assessmentMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Checkup map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Checkup.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(CheckupsCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<int, IntType>(d.id.value);
    }
    if (d.created.present) {
      map['created'] = Variable<DateTime, DateTimeType>(d.created.value);
    }
    if (d.locationId.present) {
      map['location_id'] = Variable<int, IntType>(d.locationId.value);
    }
    if (d.subjectiveQuestions.present) {
      final converter = $CheckupsTable.$converter0;
      map['subjective_questions'] = Variable<String, StringType>(
          converter.mapToSql(d.subjectiveQuestions.value));
    }
    if (d.vitals.present) {
      final converter = $CheckupsTable.$converter1;
      map['vitals'] =
          Variable<String, StringType>(converter.mapToSql(d.vitals.value));
    }
    if (d.assessment.present) {
      map['assessment'] = Variable<String, StringType>(d.assessment.value);
    }
    return map;
  }

  @override
  $CheckupsTable createAlias(String alias) {
    return $CheckupsTable(_db, alias);
  }

  static TypeConverter<SubjectiveQuestions, String> $converter0 =
      const SubjectiveQuestionsConverter();
  static TypeConverter<Vitals, String> $converter1 = const VitalsConverter();
}

class Location extends DataClass implements Insertable<Location> {
  final int id;
  final DateTime created;
  final double lat;
  final double long;
  final double accuracy;
  final double altitude;
  Location(
      {@required this.id,
      @required this.created,
      this.lat,
      this.long,
      this.accuracy,
      this.altitude});
  factory Location.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    final doubleType = db.typeSystem.forDartType<double>();
    return Location(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      created: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}created']),
      lat: doubleType.mapFromDatabaseResponse(data['${effectivePrefix}lat']),
      long: doubleType.mapFromDatabaseResponse(data['${effectivePrefix}long']),
      accuracy: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}accuracy']),
      altitude: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}altitude']),
    );
  }
  factory Location.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Location(
      id: serializer.fromJson<int>(json['id']),
      created: serializer.fromJson<DateTime>(json['created']),
      lat: serializer.fromJson<double>(json['lat']),
      long: serializer.fromJson<double>(json['long']),
      accuracy: serializer.fromJson<double>(json['accuracy']),
      altitude: serializer.fromJson<double>(json['altitude']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'created': serializer.toJson<DateTime>(created),
      'lat': serializer.toJson<double>(lat),
      'long': serializer.toJson<double>(long),
      'accuracy': serializer.toJson<double>(accuracy),
      'altitude': serializer.toJson<double>(altitude),
    };
  }

  @override
  LocationsCompanion createCompanion(bool nullToAbsent) {
    return LocationsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      created: created == null && nullToAbsent
          ? const Value.absent()
          : Value(created),
      lat: lat == null && nullToAbsent ? const Value.absent() : Value(lat),
      long: long == null && nullToAbsent ? const Value.absent() : Value(long),
      accuracy: accuracy == null && nullToAbsent
          ? const Value.absent()
          : Value(accuracy),
      altitude: altitude == null && nullToAbsent
          ? const Value.absent()
          : Value(altitude),
    );
  }

  Location copyWith(
          {int id,
          DateTime created,
          double lat,
          double long,
          double accuracy,
          double altitude}) =>
      Location(
        id: id ?? this.id,
        created: created ?? this.created,
        lat: lat ?? this.lat,
        long: long ?? this.long,
        accuracy: accuracy ?? this.accuracy,
        altitude: altitude ?? this.altitude,
      );
  @override
  String toString() {
    return (StringBuffer('Location(')
          ..write('id: $id, ')
          ..write('created: $created, ')
          ..write('lat: $lat, ')
          ..write('long: $long, ')
          ..write('accuracy: $accuracy, ')
          ..write('altitude: $altitude')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          created.hashCode,
          $mrjc(
              lat.hashCode,
              $mrjc(long.hashCode,
                  $mrjc(accuracy.hashCode, altitude.hashCode))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Location &&
          other.id == this.id &&
          other.created == this.created &&
          other.lat == this.lat &&
          other.long == this.long &&
          other.accuracy == this.accuracy &&
          other.altitude == this.altitude);
}

class LocationsCompanion extends UpdateCompanion<Location> {
  final Value<int> id;
  final Value<DateTime> created;
  final Value<double> lat;
  final Value<double> long;
  final Value<double> accuracy;
  final Value<double> altitude;
  const LocationsCompanion({
    this.id = const Value.absent(),
    this.created = const Value.absent(),
    this.lat = const Value.absent(),
    this.long = const Value.absent(),
    this.accuracy = const Value.absent(),
    this.altitude = const Value.absent(),
  });
  LocationsCompanion.insert({
    this.id = const Value.absent(),
    this.created = const Value.absent(),
    this.lat = const Value.absent(),
    this.long = const Value.absent(),
    this.accuracy = const Value.absent(),
    this.altitude = const Value.absent(),
  });
  LocationsCompanion copyWith(
      {Value<int> id,
      Value<DateTime> created,
      Value<double> lat,
      Value<double> long,
      Value<double> accuracy,
      Value<double> altitude}) {
    return LocationsCompanion(
      id: id ?? this.id,
      created: created ?? this.created,
      lat: lat ?? this.lat,
      long: long ?? this.long,
      accuracy: accuracy ?? this.accuracy,
      altitude: altitude ?? this.altitude,
    );
  }
}

class $LocationsTable extends Locations
    with TableInfo<$LocationsTable, Location> {
  final GeneratedDatabase _db;
  final String _alias;
  $LocationsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _createdMeta = const VerificationMeta('created');
  GeneratedDateTimeColumn _created;
  @override
  GeneratedDateTimeColumn get created => _created ??= _constructCreated();
  GeneratedDateTimeColumn _constructCreated() {
    return GeneratedDateTimeColumn('created', $tableName, false,
        defaultValue: currentDateAndTime);
  }

  final VerificationMeta _latMeta = const VerificationMeta('lat');
  GeneratedRealColumn _lat;
  @override
  GeneratedRealColumn get lat => _lat ??= _constructLat();
  GeneratedRealColumn _constructLat() {
    return GeneratedRealColumn(
      'lat',
      $tableName,
      true,
    );
  }

  final VerificationMeta _longMeta = const VerificationMeta('long');
  GeneratedRealColumn _long;
  @override
  GeneratedRealColumn get long => _long ??= _constructLong();
  GeneratedRealColumn _constructLong() {
    return GeneratedRealColumn(
      'long',
      $tableName,
      true,
    );
  }

  final VerificationMeta _accuracyMeta = const VerificationMeta('accuracy');
  GeneratedRealColumn _accuracy;
  @override
  GeneratedRealColumn get accuracy => _accuracy ??= _constructAccuracy();
  GeneratedRealColumn _constructAccuracy() {
    return GeneratedRealColumn(
      'accuracy',
      $tableName,
      true,
    );
  }

  final VerificationMeta _altitudeMeta = const VerificationMeta('altitude');
  GeneratedRealColumn _altitude;
  @override
  GeneratedRealColumn get altitude => _altitude ??= _constructAltitude();
  GeneratedRealColumn _constructAltitude() {
    return GeneratedRealColumn(
      'altitude',
      $tableName,
      true,
    );
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, created, lat, long, accuracy, altitude];
  @override
  $LocationsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'locations';
  @override
  final String actualTableName = 'locations';
  @override
  VerificationContext validateIntegrity(LocationsCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    }
    if (d.created.present) {
      context.handle(_createdMeta,
          created.isAcceptableValue(d.created.value, _createdMeta));
    }
    if (d.lat.present) {
      context.handle(_latMeta, lat.isAcceptableValue(d.lat.value, _latMeta));
    }
    if (d.long.present) {
      context.handle(
          _longMeta, long.isAcceptableValue(d.long.value, _longMeta));
    }
    if (d.accuracy.present) {
      context.handle(_accuracyMeta,
          accuracy.isAcceptableValue(d.accuracy.value, _accuracyMeta));
    }
    if (d.altitude.present) {
      context.handle(_altitudeMeta,
          altitude.isAcceptableValue(d.altitude.value, _altitudeMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Location map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Location.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(LocationsCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<int, IntType>(d.id.value);
    }
    if (d.created.present) {
      map['created'] = Variable<DateTime, DateTimeType>(d.created.value);
    }
    if (d.lat.present) {
      map['lat'] = Variable<double, RealType>(d.lat.value);
    }
    if (d.long.present) {
      map['long'] = Variable<double, RealType>(d.long.value);
    }
    if (d.accuracy.present) {
      map['accuracy'] = Variable<double, RealType>(d.accuracy.value);
    }
    if (d.altitude.present) {
      map['altitude'] = Variable<double, RealType>(d.altitude.value);
    }
    return map;
  }

  @override
  $LocationsTable createAlias(String alias) {
    return $LocationsTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $ActivitiesTable _activities;
  $ActivitiesTable get activities => _activities ??= $ActivitiesTable(this);
  $CheckupsTable _checkups;
  $CheckupsTable get checkups => _checkups ??= $CheckupsTable(this);
  $LocationsTable _locations;
  $LocationsTable get locations => _locations ??= $LocationsTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [activities, checkups, locations];
}
