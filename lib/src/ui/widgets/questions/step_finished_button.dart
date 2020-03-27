import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:covidnearme/src/blocs/checkup/checkup.dart';
import 'package:covidnearme/src/l10n/app_localizations.dart';

class StepFinishedButton extends StatelessWidget {
  const StepFinishedButton({
    Key key,
    @required this.validated,
    this.isLastStep = false,
  }) : super(key: key);

  final bool isLastStep;
  final bool validated;

  Widget _getCompletionMessage(AppLocalizations localizations) {
    return ConstrainedBox(
      constraints: BoxConstraints(minHeight: 36),
      child: validated
          ? null
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                localizations.checkupStepFinishedAnswerAllQuestions,
                textAlign: isLastStep ? TextAlign.center : TextAlign.end,
              ),
            ),
    );
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
          child: RaisedButton(
            onPressed: validated
                ? () {
                    if (isLastStep) {
                      context.bloc<CheckupBloc>().add(CompleteCheckup());
                    } else {
                      Provider.of<PageController>(context, listen: false)
                          .nextPage(
                        duration: Duration(milliseconds: 400),
                        curve: Curves.easeInOut,
                      );
                    }
                  }
                : null,
            child: Text(isLastStep
                ? localizations.checkupStepFinishedSubmit
                : localizations.checkupStepFinishedNext),
          ),
        ),
        AnimatedSwitcher(
            duration: const Duration(milliseconds: 1000),
            child: _getCompletionMessage(localizations)),
      ],
    );
  }
}
