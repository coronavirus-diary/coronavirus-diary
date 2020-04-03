import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:provider/provider.dart';

import 'package:covidnearme/src/blocs/preferences/preferences.dart';
import 'package:covidnearme/src/l10n/app_localizations.dart';
import 'package:covidnearme/src/ui/router.dart';
import 'package:covidnearme/src/ui/screens/symptom_report/symptom_report_controller.dart';
import 'index.dart';

class ConsentStep extends StatelessWidget implements SymptomReportStep {
  bool get isLastStep => false;
  bool get showProgress => false;

  void _handleResponse(
      {BuildContext context, PreferencesState state, bool response}) {
    // Save response
    Preferences newPreferences = state.preferences.cloneWith(
      acceptedInformedConsent: response,
    );
    context.bloc<PreferencesBloc>().add(UpdatePreferences(newPreferences));

    if (response) {
      // Advance to the next step
      Provider.of<SymptomReportController>(context, listen: false).next();
    } else {
      // Show the consent denied screen
      Navigator.pushReplacementNamed(
        context,
        SymptomReportConsentDeniedScreen.routeName,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations localizations = AppLocalizations.of(context);
    return BlocBuilder<PreferencesBloc, PreferencesState>(
      key: ValueKey('symptomReportConsentStep'),
      builder: (context, state) {
        final bool agreed = state.preferences.acceptedInformedConsent != null &&
            state.preferences.acceptedInformedConsent;
        final bool rejected =
            state.preferences.acceptedInformedConsent != null &&
                !state.preferences.acceptedInformedConsent;

        return SafeArea(
          child: Stack(
            children: <Widget>[
              Markdown(
                padding: EdgeInsets.fromLTRB(20, 40, 20, 150),
                data: localizations.consentStepQuestion,
                styleSheet:
                    MarkdownStyleSheet.fromTheme(Theme.of(context)).copyWith(
                  blockSpacing: 20,
                  h1Align: WrapAlignment.center,
                  p: Theme.of(context).textTheme.body2.copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                  textScaleFactor: MediaQuery.of(context).textScaleFactor,
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: <Color>[
                        Theme.of(context).colorScheme.surface,
                        Theme.of(context).colorScheme.surface.withOpacity(0.5),
                        Theme.of(context).colorScheme.surface.withOpacity(0),
                      ],
                      stops: <double>[0, 0.8, 1.0],
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(20, 40, 20, 20),
                    child: Wrap(
                      alignment: WrapAlignment.start,
                      spacing: 20.0,
                      runSpacing: 20.0,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: <Widget>[
                        ConstrainedBox(
                          constraints: BoxConstraints(minHeight: 60),
                          child: RaisedButton(
                            key: ValueKey(
                                'symptomReportInformedConsentRejectButton'),
                            onPressed: () => _handleResponse(
                              context: context,
                              state: state,
                              response: false,
                            ),
                            child: rejected
                                ? Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Icon(
                                        Icons.close,
                                        color: Colors.red,
                                      ),
                                      Text(localizations
                                          .consentStepDeclineActive),
                                    ],
                                  )
                                : Text(localizations.consentStepDecline),
                          ),
                        ),
                        ConstrainedBox(
                          constraints: BoxConstraints(minHeight: 60),
                          child: RaisedButton(
                            key: ValueKey(
                                'symptomReportInformedConsentAcceptButton'),
                            onPressed: () => _handleResponse(
                              context: context,
                              state: state,
                              response: true,
                            ),
                            child: agreed
                                ? Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Icon(
                                        Icons.check,
                                        color: Colors.green,
                                      ),
                                      Text(
                                          localizations.consentStepAgreeActive),
                                    ],
                                  )
                                : Text(localizations.consentStepAgree),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
