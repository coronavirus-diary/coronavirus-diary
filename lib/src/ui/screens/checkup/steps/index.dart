import 'package:flutter/material.dart';

import 'intro.dart';
import 'location.dart';
import 'subjective.dart';
import 'temperature.dart';

abstract class CheckupStep extends Widget {
  CheckupStep();

  bool get isLastStep;
}

final List<CheckupStep> steps = [
  IntroStep(),
  LocationStep(),
  SubjectiveStep(),
  TemperatureStep(),
];
