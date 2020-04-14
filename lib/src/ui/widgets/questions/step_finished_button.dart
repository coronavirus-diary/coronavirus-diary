import 'package:covidnearme/src/ui/widgets/network_unavailable_banner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'package:covidnearme/src/blocs/symptom_report/symptom_report.dart';
import 'package:covidnearme/src/l10n/app_localizations.dart';
import 'package:covidnearme/src/ui/screens/symptom_report/symptom_report_controller.dart';

class StepFinishedButton extends StatelessWidget {
  const StepFinishedButton({
    Key key,
    @required this.validated,
    this.isLastStep = false,
    this.onPressed,
  }) : super(key: key);

  final bool isLastStep;
  final bool validated;
  final VoidCallback onPressed;

  Widget _getCompletionMessage(AppLocalizations localizations) {
    return ConstrainedBox(
      constraints: BoxConstraints(minHeight: 36),
      child: validated
          ? null
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                localizations.symptomReportAnswerAllQuestions,
                textAlign: isLastStep ? TextAlign.center : TextAlign.end,
              ),
            ),
    );
  }

  void _handleOnPressed(BuildContext context) {
    onPressed?.call();
    if (isLastStep) {
      context.bloc<SymptomReportBloc>().add(CompleteSymptomReport());
    } else {
      Provider.of<SymptomReportController>(context, listen: false).next();
    }
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations localizations = AppLocalizations.of(context);
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          alignment: isLastStep ? null : AlignmentDirectional.centerEnd,
          width: 400,
          child: ValueListenableBuilder<bool>(
              valueListenable:
                  NetworkUnavailableBanner.networkUnavailableNotifier,
              builder: (context, networkUnavailable, _) {
                return RaisedButton(
                  key: ValueKey('stepFinishedButton'),
                  // Disable the Submit button if validation fails or the
                  // network is unavailable and this is the last step.
                  onPressed: (validated && (!networkUnavailable || !isLastStep))
                      ? () => _handleOnPressed(context)
                      : null,
                  child: Text(isLastStep
                      ? localizations.symptomReportSubmitButton
                      : localizations.symptomReportNextButton),
                );
              }),
        ),
        AnimatedSwitcher(
            duration: const Duration(milliseconds: 1000),
            child: _getCompletionMessage(localizations)),
      ],
    );
  }
}
