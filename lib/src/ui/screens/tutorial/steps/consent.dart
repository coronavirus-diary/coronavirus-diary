import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:provider/provider.dart';

import 'package:covidnearme/src/blocs/preferences/preferences.dart';
import 'package:covidnearme/src/l10n/app_localizations.dart';
import 'package:covidnearme/src/ui/widgets/loading_indicator.dart';

class ConsentStep extends StatelessWidget {
  void _handleResponse(
      {BuildContext context, PreferencesState state, bool response}) {
    // Save response
    Preferences newPreferences = state.preferences.cloneWith(
      agreedToTerms: response,
    );
    context.bloc<PreferencesBloc>().add(UpdatePreferences(newPreferences));

    if (response) {
      // Advance to the next page if consent is given.
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
          child: FutureBuilder(
            future: rootBundle.loadString('assets/copy/consent.md'),
            builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
              if (snapshot.hasData) {
                return Stack(
                  children: <Widget>[
                    Markdown(
                      padding: EdgeInsets.fromLTRB(20, 40, 20, 150),
                      data: snapshot.data,
                      styleSheet:
                          MarkdownStyleSheet.fromTheme(Theme.of(context))
                              .copyWith(
                        blockSpacing: 20,
                        h1Align: WrapAlignment.center,
                        p: TextStyle(fontSize: 18),
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
                              Theme.of(context).primaryColor,
                              Theme.of(context).primaryColor.withOpacity(0.6),
                              Theme.of(context).primaryColor.withOpacity(0),
                            ],
                            stops: <double>[0, 0.8, 1.0],
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(20, 40, 20, 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              RaisedButton(
                                onPressed: () => _handleResponse(
                                  context: context,
                                  state: state,
                                  response: false,
                                ),
                                child: rejected
                                    ? Row(
                                        children: <Widget>[
                                          Icon(
                                            Icons.close,
                                            color: Colors.red,
                                          ),
                                          Text(localizations.consentStepDidNotAgree),
                                        ],
                                      )
                                    : Text(localizations.consentStepNo),
                              ),
                              RaisedButton(
                                onPressed: () => _handleResponse(
                                  context: context,
                                  state: state,
                                  response: true,
                                ),
                                child: agreed
                                    ? Row(
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
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              } else {
                return LoadingIndicator(localizations.consentStepLoading);
              }
            },
          ),
        );
      },
    );
  }
}
