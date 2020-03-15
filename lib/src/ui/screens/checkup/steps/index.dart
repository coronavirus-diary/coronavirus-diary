import 'package:flutter/material.dart';

import 'breath.dart';
import 'cough.dart';
import 'intro.dart';

abstract class CheckupStep extends Widget {
  const CheckupStep();
}

final List<CheckupStep> steps = [IntroStep(), BreathStep(), CoughStep()];
