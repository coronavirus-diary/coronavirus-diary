import 'dart:io';

import 'package:moor/moor.dart';
import 'package:moor_ffi/moor_ffi.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

import 'package:coronavirus_diary/src/data/models/subjective_questions.dart';
import 'package:coronavirus_diary/src/data/models/vitals.dart';
import 'tables/index.dart';

part 'database.g.dart';

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    // Store db.sqlite here in the app's documents folder
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(path.join(dbFolder.path, 'db.sqlite'));
    return VmDatabase(file);
  });
}

@UseMoor(tables: tables)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<List<ActivityWithLocation>> allActivities() async {
    final rows = await select(activities).join([
      leftOuterJoin(
        activities,
        activities.location_id.equalsExp(locations.id),
      ),
    ]).get();

    return rows.map((resultRow) {
      return ActivityWithLocation(
        activity: resultRow.readTable(activities),
        location: resultRow.readTable(locations),
      );
    }).toList();
  }
}

class ActivityWithLocation {
  final Activity activity;
  final Location location;

  ActivityWithLocation({
    this.activity,
    this.location,
  });
}
