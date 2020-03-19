import 'package:flutter/material.dart';

import 'subjective.dart';
import 'intro.dart';

abstract class CheckupStep extends Widget {}

final List<CheckupStep> steps = [
  IntroStep(),
  SubjectiveStep(),
];
