import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:provider/provider.dart';

import 'package:covidnearme/src/blocs/preferences/preferences.dart';
import 'package:covidnearme/src/l10n/app_localizations.dart';
import 'package:covidnearme/src/ui/router.dart';

class ConsentStep extends StatelessWidget {
  void _handleResponse(
      {BuildContext context, PreferencesState state, bool response}) {
    // Save response
    Preferences newPreferences = state.preferences.cloneWith(
      agreedToTerms: response,
    );
    context.bloc<PreferencesBloc>().add(UpdatePreferences(newPreferences));

    if (response && newPreferences.location != null) {
      // If the user consented, but they have already specified their location,
      // skip the location step.

      // Navigate to home page and put it at the
      // bottom of the navigation stack if consent is given.
      Navigator.pushNamedAndRemoveUntil(
        context,
        HomeScreen.routeName,
        (Route<dynamic> route) => false,
      );
    } else {
      // Advance to the ConsentBranch step.
      Provider.of<PageController>(context, listen: false).nextPage(
        duration: Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations localizations = AppLocalizations.of(context);
    return BlocBuilder<PreferencesBloc, PreferencesState>(
      builder: (context, state) {
        final bool agreed = state.preferences.agreedToTerms != null &&
            state.preferences.agreedToTerms;
        final bool rejected = state.preferences.agreedToTerms != null &&
            !state.preferences.agreedToTerms;

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
                                      Text(
                                          localizations.consentStepDidNotAgree),
                                    ],
                                  )
                                : Text(localizations.consentStepNo),
                          ),
                        ),
                        ConstrainedBox(
                          constraints: BoxConstraints(minHeight: 60),
                          child: RaisedButton(
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
                                      Text(localizations.consentStepAgreed),
                                    ],
                                  )
                                : Text(localizations.consentStepIAgree),
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
