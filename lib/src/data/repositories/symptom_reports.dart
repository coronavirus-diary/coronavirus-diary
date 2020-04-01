import 'dart:async';

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

  Future<void> completeSymptomReport(String id) async {
    await Future.delayed(Duration(seconds: 2));
  }
}
