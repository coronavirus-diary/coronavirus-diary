import 'package:covidnearme/src/blocs/symptom_report/symptom_report.dart';
import 'package:covidnearme/src/data/models/symptom_report.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';

import 'package:covidnearme/src/blocs/questions/questions.dart';
import 'package:covidnearme/src/ui/utils/symptom_reports.dart';
import 'steps/index.dart';
import 'symptom_report_progress_bar.dart';

class SymptomReportLoadedBody extends StatefulWidget {
  @override
  _SymptomReportLoadedBodyState createState() => _SymptomReportLoadedBodyState();
}

class _SymptomReportLoadedBodyState extends State<SymptomReportLoadedBody> {
  int currentIndex = 0;
  SymptomReportStep currentStep = steps[0];

  void _saveCurrentLocation(SymptomReportStateInProgress symptomReportState) async {
    final Geolocator geolocator = Geolocator();

    try {
      final Position position = await geolocator.getCurrentPosition(
        locationPermissionLevel: GeolocationPermission.locationWhenInUse,
      );
      final List<Placemark> places = await geolocator.placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );
      final String zipCode = places[0].postalCode;

      updateSymptomReport(
        context: context,
        symptomReportState: symptomReportState,
        updateFunction: (SymptomReport symptomReport) {
          symptomReport.location = SymptomReportLocation(zipCode: zipCode);
          return symptomReport;
        },
      );
    } catch (e) {
      print(e);
    }
  }

  void _handlePageChange(
    int index,
    SymptomReportStateInProgress symptomReportState,
    QuestionsState questionsState,
  ) async {
    final int oldIndex = currentIndex;
    setState(() {
      currentIndex = index;
      currentStep = steps[index];
    });
    // Origin-specific actions
    if (oldIndex == 0) {
      if (symptomReportState.symptomReport.dataContributionPreference == true) {
        await _saveCurrentLocation(symptomReportState);
      }
    }
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
