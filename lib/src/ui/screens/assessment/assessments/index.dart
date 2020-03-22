import 'package:flutter/material.dart';

import 'package:covidnearme/src/data/models/assessments.dart';
import 'positive.dart';
import 'negative.dart';

export 'positive.dart';
export 'negative.dart';

Widget getAssessmentView(Assessment assessment) {
  if (assessment.matchesPuiSymptoms) {
    return PositiveAssessment();
  } else {
    return NegativeAssessment();
  }
}
