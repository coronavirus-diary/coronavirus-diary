import 'package:moor/moor.dart';

class Locations extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get created => dateTime().withDefault(currentDateAndTime)();

  // Location
  RealColumn get locationLat => real().nullable()();
  RealColumn get locationLong => real().nullable()();
  RealColumn get locationAccuracy => real().nullable()();
  RealColumn get locationAltitude => real().nullable()();
}
