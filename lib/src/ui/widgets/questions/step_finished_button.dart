import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:covidnearme/src/blocs/checkup/checkup.dart';
import 'package:covidnearme/src/l10n/app_localizations.dart';

class StepFinishedButton extends StatelessWidget {
  const StepFinishedButton({
    Key key,
    this.isLastStep = false,
  }) : super(key: key);

  final bool isLastStep;

  @override
  Widget build(BuildContext context) {
    final AppLocalizations localizations = AppLocalizations.of(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      width: 400,
      child: RaisedButton(
        onPressed: () {
          if (isLastStep) {
            context.bloc<CheckupBloc>().add(CompleteCheckup());
          } else {
            Provider.of<PageController>(context, listen: false).nextPage(
              duration: Duration(milliseconds: 400),
              curve: Curves.easeInOut,
            );
          }
        },
        child: Text(isLastStep
            ? localizations.checkupProgressBarSubmit
            : localizations.checkupProgressBarContinue),
      ),
    );
  }
}
