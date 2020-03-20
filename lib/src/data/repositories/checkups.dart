import 'dart:async';
import 'dart:math';

import 'package:coronavirus_diary/src/data/models/assessments.dart';
import 'package:coronavirus_diary/src/data/models/checkups.dart';

class CheckupsRepository {
  Future<Checkup> createCheckup(Checkup checkup) async {
    await Future.delayed(Duration(seconds: 1));
    return checkup;
  }

  Future<Checkup> updateCheckup(Checkup updatedCheckup) async {
    await Future.delayed(Duration(seconds: 1));
    return updatedCheckup;
  }

  Future<Assessment> completeCheckup(String id) async {
    await Future.delayed(Duration(seconds: 1));
    return Assessment(
      processed: DateTime.now(),
      matchesPuiSymptoms: Random().nextBool(),
    );
  }
}
