import 'package:moor/moor.dart';

class Locations extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get created => dateTime().withDefault(currentDateAndTime)();

  // Location
  RealColumn get lat => real().nullable()();
  RealColumn get long => real().nullable()();
  RealColumn get accuracy => real().nullable()();
  RealColumn get altitude => real().nullable()();
}
