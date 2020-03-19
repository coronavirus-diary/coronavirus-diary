import 'package:flutter/material.dart';

import 'subjective.dart';
import 'intro.dart';

abstract class CheckupStep extends Widget {
  const CheckupStep();
}

final List<CheckupStep> steps = [
  IntroStep(),
  SubjectiveStep(),
];
