import 'package:flutter/material.dart';

import 'intro.dart';
import 'subjective.dart';
import 'temperature.dart';

abstract class CheckupStep extends Widget {
  /// Returns `true` if the step is ready to be continued.
  ///
  /// If the page doesn't require any user inputs, make this always return `true`.
  bool readyToContinue();

  /// Message displayed to the user if the step is not ready.
  ///
  /// A popup will show up to display the message if `readyToContinue` returns false.
  String notReadyUserMessage();
}

final List<CheckupStep> steps = [
  IntroStep(),
  SubjectiveStep(),
  TemperatureStep(),
];
