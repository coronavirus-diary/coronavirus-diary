import 'dart:async';
import 'dart:math';

import 'package:covidnearme/src/data/models/assessments.dart';
import 'package:covidnearme/src/data/models/symptom_report.dart';

class SymptomReportsRepository {
  Future<SymptomReport> createSymptomReport(SymptomReport report) async {
    await Future.delayed(Duration(seconds: 1));
    return report;
  }

  Future<SymptomReport> updateSymptomReport(SymptomReport report) async {
    await Future.delayed(Duration(seconds: 1));
    return report;
  }

  Future<Assessment> completeSymptomReport(String id) async {
    await Future.delayed(Duration(seconds: 2));
    return Assessment(
      processed: DateTime.now(),
      matchesPuiSymptoms: Random().nextBool(),
    );
  }
}
