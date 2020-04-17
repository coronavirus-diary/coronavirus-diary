import 'dart:async';

import 'package:covidnearme/src/data/models/symptom_report.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hud/flutter_hud.dart';
import 'package:provider/provider.dart';

import 'package:covidnearme/src/blocs/questions/questions.dart';
import 'package:covidnearme/src/blocs/preferences/preferences.dart';
import 'package:covidnearme/src/blocs/symptom_report/symptom_report.dart';
import 'package:covidnearme/src/data/repositories/questions.dart';
import 'package:covidnearme/src/l10n/app_localizations.dart';
import 'package:covidnearme/src/ui/router.dart';
import 'package:covidnearme/src/ui/widgets/loading_indicator.dart';
import 'package:covidnearme/src/ui/widgets/network_unavailable_banner.dart';

import 'symptom_report_controller.dart';
import 'symptom_report_loaded_body.dart';
import 'steps/index.dart';

class SymptomReportScreen extends StatefulWidget {
  static const routeName = '/symptom_report';

  const SymptomReportScreen();

  @override
  _SymptomReportScreenState createState() => _SymptomReportScreenState();
}

class _SymptomReportScreenState extends State<SymptomReportScreen> {
  AppLocalizations localizations;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    localizations = AppLocalizations.of(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<QuestionsBloc>(
        create: (context) {
          return QuestionsBloc(
            questionsRepository: QuestionsRepository(),
            localizations: localizations,
          )..add(LoadQuestions());
        },
        lazy: false,
        child: SymptomReportScreenBody());
  }
}

class SymptomReportScreenBody extends StatefulWidget {
  @override
  _SymptomReportScreenBodyState createState() =>
      _SymptomReportScreenBodyState();
}

class _SymptomReportScreenBodyState extends State<SymptomReportScreenBody> {
  // Storing the page controller at this level so that we can access it
  // across the entire symptom report experience
  PageController _pageController;
  bool _showSnackbar = false;
  bool _showSubmittingReportHUD = false;
  List<SymptomReportStep> steps = [];
  SymptomReport _lastAttemptedReport;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  Widget _getUnloadedBody(
    SymptomReportState symptomReportState,
  ) {
    if (symptomReportState is SymptomReportStateNotCreated) {
      context.bloc<SymptomReportBloc>().add(const StartSymptomReport());
    }
    return LoadingIndicator(AppLocalizations.of(context).symptomReportLoading);
  }

  Widget _getErrorBody() {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Text(
          AppLocalizations.of(context).symptomReportErrorRetrievingExperience,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  void _handleSymptomReportCompletion(
    BuildContext context,
    SymptomReportStateCompleted symptomReportState,
  ) {
    _lastAttemptedReport = null;

    // Move back to the not created state, to clear out the symptom report.
    context.bloc<SymptomReportBloc>().add(const ClearSymptomReport());

    // Navigate to thank you screen
    Navigator.pushReplacementNamed(
      context,
      ThankYouScreen.routeName,
    );
  }

  Widget _getBody(
    SymptomReportState symptomReportState,
    List<SymptomReportStep> steps,
  ) {
    switch (symptomReportState.runtimeType) {
      case SymptomReportStateNotCreated:
      case SymptomReportStateCreating:
        return _getUnloadedBody(symptomReportState);
      case SymptomReportStateInProgress:
        return SymptomReportLoadedBody(
          steps: steps,
          jumpToLastStep: _showSnackbar,
        );
      case SymptomReportStateCompleting:
      case SymptomReportStateCompleted:
        return Container();
      default:
        return _getErrorBody();
    }
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations localizations = AppLocalizations.of(context);
    return BlocBuilder<PreferencesBloc, PreferencesState>(
      builder: (context, state) {
        final PreferencesState preferencesState = state;
        if (steps.isEmpty) {
          steps = getSteps(state);
        }
        return WidgetHUD(
          showHUD: _showSubmittingReportHUD,
          hud: HUD(
            color: Theme.of(context).colorScheme.surface,
            opacity: 1.0,
            labelStyle: Theme.of(context).textTheme.headline,
            label: localizations.systemReportSubmitting,
          ),
          builder: (context) {
            return MultiProvider(
              providers: [
                Provider<SymptomReportController>.value(
                  value: SymptomReportController(
                    context: context,
                    pageController: _pageController,
                    preferencesState: preferencesState,
                    steps: steps,
                  ),
                ),
                Provider<SymptomReport>.value(
                  value: _lastAttemptedReport,
                )
              ],
              child: Scaffold(
                appBar: AppBar(
                  title: Text(AppLocalizations.of(context).symptomReportTitle),
                  leading: IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () => Navigator.pop(context),
                    tooltip: localizations.systemReportBackToHomePage,
                  ),
                ),
                backgroundColor: Theme.of(context).backgroundColor,
                body: BlocConsumer<SymptomReportBloc, SymptomReportState>(
                  listener: (context, state) {
                    if (state is SymptomReportStateCompleting) {
                      if (!_showSubmittingReportHUD) {
                        setState(() {
                          _showSubmittingReportHUD = true;
                        });
                      }
                    } else if (state is SymptomReportStateCompleted) {
                      _handleSymptomReportCompletion(context, state);
                    } else if (state is SymptomReportStateNetworkError) {
                      setState(() {
                        _lastAttemptedReport = state.symptomReport;
                        _showSnackbar = true;
                        _showSubmittingReportHUD = false;
                      });
                    }
                  },
                  builder: (context, state) {
                    final SymptomReportState symptomReportState = state;
                    final body = NetworkUnavailableBanner.wrap(
                      _getBody(symptomReportState, steps),
                    );
                    if (_showSnackbar) {
                      // Show the snackbar after the build method is complete.
                      scheduleMicrotask(() {
                        Scaffold.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.red,
                            content: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Text(
                                AppLocalizations.of(context)
                                    .networkRequestError,
                                style: Theme.of(context).textTheme.headline,
                              ),
                            ),
                          ),
                        );
                      });
                      _showSnackbar = false;
                    }
                    return body;
                  },
                ),
              ),
            );
          },
        );
      },
    );
  }
}
