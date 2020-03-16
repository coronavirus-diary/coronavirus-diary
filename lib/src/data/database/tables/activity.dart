import 'package:moor/moor.dart';

@DataClassName("Activity")
class Activities extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get created => dateTime().withDefault(currentDateAndTime)();

  // Location
  IntColumn get location_id =>
      integer().nullable().customConstraint('NULL REFERENCES locations(id)')();

  // Comma-separated participant names
  TextColumn get participants => text().nullable()();
}
