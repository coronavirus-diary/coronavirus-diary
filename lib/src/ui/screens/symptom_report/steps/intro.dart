import 'package:covidnearme/src/blocs/symptom_report/symptom_report.dart';
import 'package:covidnearme/src/data/models/symptom_report.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import 'package:covidnearme/src/l10n/app_localizations.dart';
import 'package:covidnearme/src/ui/widgets/scrollable_body.dart';
import 'package:covidnearme/src/ui/utils/symptom_reports.dart';
import 'index.dart';

class IntroStep extends StatefulWidget implements SymptomReportStep {
  bool get isLastStep => false;

  @override
  _IntroStepState createState() => _IntroStepState();
}

class _IntroStepState extends State<IntroStep> {
  void _updateDataContributionPreference(
    bool value,
    SymptomReportStateInProgress symptomReportState,
  ) {
    updateSymptomReport(
      context: context,
      symptomReportState: symptomReportState,
      updateFunction: (SymptomReport report) {
        report.dataContributionPreference = value;

        // Make sure to clear location if the user has disabled data sharing
        if (!value) {
          report.location = null;
        }

        return report;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations localizations = AppLocalizations.of(context);
    return BlocBuilder<SymptomReportBloc, SymptomReportState>(
      builder: (context, state) {
        final SymptomReportStateInProgress symptomReportState = state;
        return ScrollableBody(
          child: Container(
            color: Theme.of(context).colorScheme.surface,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: FaIcon(
                    FontAwesomeIcons.heartbeat,
                    size: 100,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Text(
                    localizations.introStepTimeForYourCheckup,
                    style: Theme.of(context).textTheme.title,
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Text(
                    localizations.introStepWeWillAskQuestions,
                    style: Theme.of(context).textTheme.subtitle,
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Text(
                    localizations.introStepAtTheEnd,
                    style: Theme.of(context).textTheme.subtitle,
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  decoration: ShapeDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                      side: BorderSide(),
                    ),
                  ),
                  margin: EdgeInsets.all(20),
                  child: SwitchListTile(
                    activeColor: Theme.of(context).accentColor,
                    contentPadding: EdgeInsets.all(20),
                    secondary: FaIcon(
                      FontAwesomeIcons.handHoldingHeart,
                      size: 35,
                    ),
                    title: Text(
                      localizations.introStepSwitchLabelContributeData,
                    ),
                    subtitle: Container(
                      margin: EdgeInsets.only(top: 5),
                      child: Text(
                        localizations.introStepSwitchLabelCollectPostalCode,
                      ),
                    ),
                    onChanged: (bool value) =>
                        _updateDataContributionPreference(
                            value, symptomReportState),
                    value: symptomReportState
                        .symptomReport.dataContributionPreference,
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: RaisedButton(
                    onPressed: () {
                      Provider.of<PageController>(context, listen: false)
                          .nextPage(
                        duration: Duration(milliseconds: 400),
                        curve: Curves.easeInOut,
                      );
                    },
                    child: Text(localizations.introStepButtonStartLabel),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
