import 'dart:async';

import 'package:covidnearme/src/data/apis/covidnearme.dart';
import 'package:covidnearme/src/data/models/symptom_report.dart';
import 'package:covidnearme/src/utils/env.dart';

export 'package:covidnearme/src/data/models/symptom_report.dart';

class SymptomReportsRepository {
  Future<SymptomReport> createSymptomReport(SymptomReport symptomReport) async {
    if (appEnv['SKIP_PRIVATE_API'] != 'true') {
      await covidNearMeApi.createSymptomReport(symptomReport);
    }
    return symptomReport;
  }
}
