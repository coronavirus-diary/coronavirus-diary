import 'dart:async';

import 'package:covidnearme/src/data/apis/covidnearme.dart';
import 'package:covidnearme/src/data/models/symptom_report.dart';

class SymptomReportsRepository {
  Future<SymptomReport> createSymptomReport(SymptomReport symptomReport) async {
    await covidNearMeApi.createSymptomReport(symptomReport);
    return symptomReport;
  }
}
