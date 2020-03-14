// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Checkup extends DataClass implements Insertable<Checkup> {
  final int id;
  final DateTime created;
  final double locationLat;
  final double locationLong;
  final double locationAccuracy;
  final double locationAltitude;
  final SubjectiveQuestions subjectiveQuestions;
  final Vitals vitals;
  Checkup(
      {@required this.id,
      @required this.created,
      this.locationLat,
      this.locationLong,
      this.locationAccuracy,
      this.locationAltitude,
      @required this.subjectiveQuestions,
      @required this.vitals});
  factory Checkup.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    final doubleType = db.typeSystem.forDartType<double>();
    final stringType = db.typeSystem.forDartType<String>();
    return Checkup(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      created: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}created']),
      locationLat: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}location_lat']),
      locationLong: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}location_long']),
      locationAccuracy: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}location_accuracy']),
      locationAltitude: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}location_altitude']),
      subjectiveQuestions: $CheckupsTable.$converter0.mapToDart(
          stringType.mapFromDatabaseResponse(
              data['${effectivePrefix}subjective_questions'])),
      vitals: $CheckupsTable.$converter1.mapToDart(
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}vitals'])),
    );
  }
  factory Checkup.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Checkup(
      id: serializer.fromJson<int>(json['id']),
      created: serializer.fromJson<DateTime>(json['created']),
      locationLat: serializer.fromJson<double>(json['locationLat']),
      locationLong: serializer.fromJson<double>(json['locationLong']),
      locationAccuracy: serializer.fromJson<double>(json['locationAccuracy']),
      locationAltitude: serializer.fromJson<double>(json['locationAltitude']),
      subjectiveQuestions:
          serializer.fromJson<SubjectiveQuestions>(json['subjectiveQuestions']),
      vitals: serializer.fromJson<Vitals>(json['vitals']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'created': serializer.toJson<DateTime>(created),
      'locationLat': serializer.toJson<double>(locationLat),
      'locationLong': serializer.toJson<double>(locationLong),
      'locationAccuracy': serializer.toJson<double>(locationAccuracy),
      'locationAltitude': serializer.toJson<double>(locationAltitude),
      'subjectiveQuestions':
          serializer.toJson<SubjectiveQuestions>(subjectiveQuestions),
      'vitals': serializer.toJson<Vitals>(vitals),
    };
  }

  @override
  CheckupsCompanion createCompanion(bool nullToAbsent) {
    return CheckupsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      created: created == null && nullToAbsent
          ? const Value.absent()
          : Value(created),
      locationLat: locationLat == null && nullToAbsent
          ? const Value.absent()
          : Value(locationLat),
      locationLong: locationLong == null && nullToAbsent
          ? const Value.absent()
          : Value(locationLong),
      locationAccuracy: locationAccuracy == null && nullToAbsent
          ? const Value.absent()
          : Value(locationAccuracy),
      locationAltitude: locationAltitude == null && nullToAbsent
          ? const Value.absent()
          : Value(locationAltitude),
      subjectiveQuestions: subjectiveQuestions == null && nullToAbsent
          ? const Value.absent()
          : Value(subjectiveQuestions),
      vitals:
          vitals == null && nullToAbsent ? const Value.absent() : Value(vitals),
    );
  }

  Checkup copyWith(
          {int id,
          DateTime created,
          double locationLat,
          double locationLong,
          double locationAccuracy,
          double locationAltitude,
          SubjectiveQuestions subjectiveQuestions,
          Vitals vitals}) =>
      Checkup(
        id: id ?? this.id,
        created: created ?? this.created,
        locationLat: locationLat ?? this.locationLat,
        locationLong: locationLong ?? this.locationLong,
        locationAccuracy: locationAccuracy ?? this.locationAccuracy,
        locationAltitude: locationAltitude ?? this.locationAltitude,
        subjectiveQuestions: subjectiveQuestions ?? this.subjectiveQuestions,
        vitals: vitals ?? this.vitals,
      );
  @override
  String toString() {
    return (StringBuffer('Checkup(')
          ..write('id: $id, ')
          ..write('created: $created, ')
          ..write('locationLat: $locationLat, ')
          ..write('locationLong: $locationLong, ')
          ..write('locationAccuracy: $locationAccuracy, ')
          ..write('locationAltitude: $locationAltitude, ')
          ..write('subjectiveQuestions: $subjectiveQuestions, ')
          ..write('vitals: $vitals')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          created.hashCode,
          $mrjc(
              locationLat.hashCode,
              $mrjc(
                  locationLong.hashCode,
                  $mrjc(
                      locationAccuracy.hashCode,
                      $mrjc(
                          locationAltitude.hashCode,
                          $mrjc(subjectiveQuestions.hashCode,
                              vitals.hashCode))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Checkup &&
          other.id == this.id &&
          other.created == this.created &&
          other.locationLat == this.locationLat &&
          other.locationLong == this.locationLong &&
          other.locationAccuracy == this.locationAccuracy &&
          other.locationAltitude == this.locationAltitude &&
          other.subjectiveQuestions == this.subjectiveQuestions &&
          other.vitals == this.vitals);
}

class CheckupsCompanion extends UpdateCompanion<Checkup> {
  final Value<int> id;
  final Value<DateTime> created;
  final Value<double> locationLat;
  final Value<double> locationLong;
  final Value<double> locationAccuracy;
  final Value<double> locationAltitude;
  final Value<SubjectiveQuestions> subjectiveQuestions;
  final Value<Vitals> vitals;
  const CheckupsCompanion({
    this.id = const Value.absent(),
    this.created = const Value.absent(),
    this.locationLat = const Value.absent(),
    this.locationLong = const Value.absent(),
    this.locationAccuracy = const Value.absent(),
    this.locationAltitude = const Value.absent(),
    this.subjectiveQuestions = const Value.absent(),
    this.vitals = const Value.absent(),
  });
  CheckupsCompanion.insert({
    this.id = const Value.absent(),
    this.created = const Value.absent(),
    this.locationLat = const Value.absent(),
    this.locationLong = const Value.absent(),
    this.locationAccuracy = const Value.absent(),
    this.locationAltitude = const Value.absent(),
    @required SubjectiveQuestions subjectiveQuestions,
    @required Vitals vitals,
  })  : subjectiveQuestions = Value(subjectiveQuestions),
        vitals = Value(vitals);
  CheckupsCompanion copyWith(
      {Value<int> id,
      Value<DateTime> created,
      Value<double> locationLat,
      Value<double> locationLong,
      Value<double> locationAccuracy,
      Value<double> locationAltitude,
      Value<SubjectiveQuestions> subjectiveQuestions,
      Value<Vitals> vitals}) {
    return CheckupsCompanion(
      id: id ?? this.id,
      created: created ?? this.created,
      locationLat: locationLat ?? this.locationLat,
      locationLong: locationLong ?? this.locationLong,
      locationAccuracy: locationAccuracy ?? this.locationAccuracy,
      locationAltitude: locationAltitude ?? this.locationAltitude,
      subjectiveQuestions: subjectiveQuestions ?? this.subjectiveQuestions,
      vitals: vitals ?? this.vitals,
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

  final VerificationMeta _locationLatMeta =
      const VerificationMeta('locationLat');
  GeneratedRealColumn _locationLat;
  @override
  GeneratedRealColumn get locationLat =>
      _locationLat ??= _constructLocationLat();
  GeneratedRealColumn _constructLocationLat() {
    return GeneratedRealColumn(
      'location_lat',
      $tableName,
      true,
    );
  }

  final VerificationMeta _locationLongMeta =
      const VerificationMeta('locationLong');
  GeneratedRealColumn _locationLong;
  @override
  GeneratedRealColumn get locationLong =>
      _locationLong ??= _constructLocationLong();
  GeneratedRealColumn _constructLocationLong() {
    return GeneratedRealColumn(
      'location_long',
      $tableName,
      true,
    );
  }

  final VerificationMeta _locationAccuracyMeta =
      const VerificationMeta('locationAccuracy');
  GeneratedRealColumn _locationAccuracy;
  @override
  GeneratedRealColumn get locationAccuracy =>
      _locationAccuracy ??= _constructLocationAccuracy();
  GeneratedRealColumn _constructLocationAccuracy() {
    return GeneratedRealColumn(
      'location_accuracy',
      $tableName,
      true,
    );
  }

  final VerificationMeta _locationAltitudeMeta =
      const VerificationMeta('locationAltitude');
  GeneratedRealColumn _locationAltitude;
  @override
  GeneratedRealColumn get locationAltitude =>
      _locationAltitude ??= _constructLocationAltitude();
  GeneratedRealColumn _constructLocationAltitude() {
    return GeneratedRealColumn(
      'location_altitude',
      $tableName,
      true,
    );
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
      false,
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
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [
        id,
        created,
        locationLat,
        locationLong,
        locationAccuracy,
        locationAltitude,
        subjectiveQuestions,
        vitals
      ];
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
    if (d.locationLat.present) {
      context.handle(_locationLatMeta,
          locationLat.isAcceptableValue(d.locationLat.value, _locationLatMeta));
    }
    if (d.locationLong.present) {
      context.handle(
          _locationLongMeta,
          locationLong.isAcceptableValue(
              d.locationLong.value, _locationLongMeta));
    }
    if (d.locationAccuracy.present) {
      context.handle(
          _locationAccuracyMeta,
          locationAccuracy.isAcceptableValue(
              d.locationAccuracy.value, _locationAccuracyMeta));
    }
    if (d.locationAltitude.present) {
      context.handle(
          _locationAltitudeMeta,
          locationAltitude.isAcceptableValue(
              d.locationAltitude.value, _locationAltitudeMeta));
    }
    context.handle(
        _subjectiveQuestionsMeta, const VerificationResult.success());
    context.handle(_vitalsMeta, const VerificationResult.success());
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
    if (d.locationLat.present) {
      map['location_lat'] = Variable<double, RealType>(d.locationLat.value);
    }
    if (d.locationLong.present) {
      map['location_long'] = Variable<double, RealType>(d.locationLong.value);
    }
    if (d.locationAccuracy.present) {
      map['location_accuracy'] =
          Variable<double, RealType>(d.locationAccuracy.value);
    }
    if (d.locationAltitude.present) {
      map['location_altitude'] =
          Variable<double, RealType>(d.locationAltitude.value);
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

abstract class _$Database extends GeneratedDatabase {
  _$Database(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $CheckupsTable _checkups;
  $CheckupsTable get checkups => _checkups ??= $CheckupsTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [checkups];
}
