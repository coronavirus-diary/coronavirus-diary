import 'package:covidnearme/src/blocs/symptom_report/symptom_report.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'package:covidnearme/src/blocs/questions/questions.dart';
import 'steps/index.dart';
import 'symptom_report_progress_bar.dart';

class SymptomReportLoadedBody extends StatefulWidget {
  @override
  _SymptomReportLoadedBodyState createState() =>
      _SymptomReportLoadedBodyState();
}

class _SymptomReportLoadedBodyState extends State<SymptomReportLoadedBody> {
  int currentIndex = 0;
  SymptomReportStep currentStep = steps[0];

  void _handlePageChange(
    int index,
    SymptomReportStateInProgress symptomReportState,
    QuestionsState questionsState,
  ) async {
    setState(() {
      currentIndex = index;
      currentStep = steps[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SymptomReportBloc, SymptomReportState>(
      builder: (context, state) {
        final SymptomReportState checkupState = state;

        return BlocBuilder<QuestionsBloc, QuestionsState>(
          builder: (context, state) {
            final QuestionsState questionsState = state;
            return Column(
              children: <Widget>[
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 200),
                  child: currentStep != null && currentIndex > 0
                      ? SymptomReportProgressBar(
                          currentIndex: currentIndex,
                          // Subtract one because the intro isn't really a step.
                          stepsLength: steps.length - 1,
                        )
                      : Container(),
                ),
                Expanded(
                  child: PageView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    controller: Provider.of<PageController>(context),
                    onPageChanged: (int index) => _handlePageChange(
                      index,
                      checkupState,
                      questionsState,
                    ),
                    itemCount: steps.length,
                    itemBuilder: (BuildContext context, int index) {
                      return steps[index];
                    },
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
