import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hud/flutter_hud.dart';
import 'package:provider/provider.dart';

import 'package:covidnearme/src/blocs/preferences/preferences.dart';
import 'package:covidnearme/src/blocs/questions/questions.dart';
import 'package:covidnearme/src/blocs/symptom_report/symptom_report.dart';
import 'package:covidnearme/src/data/repositories/questions.dart';
import 'package:covidnearme/src/l10n/app_localizations.dart';
import 'package:covidnearme/src/ui/router.dart';
import 'package:covidnearme/src/ui/widgets/loading_indicator.dart';
import 'package:covidnearme/src/ui/widgets/network_unavailable_banner.dart';

import 'symptom_report_loaded_body.dart';

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
  // across the entire checkup experience
  PageController _pageController;
  bool _showLoadingAssessmentHUD = false;

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
    return LoadingIndicator('Loading your health checkup');
  }

  Widget _getErrorBody() {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Text(
          AppLocalizations.of(context).checkupScreenErrorRetrievingExperience,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  void _handleCheckupCompletion(
    PreferencesState preferencesState,
    SymptomReportStateCompleted symptomReportState,
  ) {
    // Remember assessment
    if (preferencesState.preferences.lastAssessment !=
        symptomReportState.assessment) {
      Preferences newPreferences = preferencesState.preferences.cloneWith(
        lastAssessment: symptomReportState.assessment,
        // If they've completed an assessment, then don't show them the welcome
        // screen again.
        completedTutorial: true,
      );
      context.bloc<PreferencesBloc>().add(UpdatePreferences(newPreferences));
    }

    // Navigate to assessment view
    Navigator.pushReplacementNamed(
      context,
      AssessmentScreen.routeName,
      arguments: AssessmentScreenArguments(
        assessment: symptomReportState.assessment,
      ),
    );
  }

  Widget _getBody(
    PreferencesState preferencesState,
    SymptomReportState symptomReportState,
  ) {
    switch (symptomReportState.runtimeType) {
      case SymptomReportStateNotCreated:
      case SymptomReportStateCreating:
        return _getUnloadedBody(symptomReportState);
      case SymptomReportStateInProgress:
        return SymptomReportLoadedBody();
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

        return BlocConsumer<SymptomReportBloc, SymptomReportState>(
          listener: (context, state) {
            if (state is SymptomReportStateCompleting) {
              if (!_showLoadingAssessmentHUD) {
                setState(() {
                  _showLoadingAssessmentHUD = true;
                });
              }
            } else if (state is SymptomReportStateCompleted) {
              _handleCheckupCompletion(preferencesState, state);
            }
          },
          builder: (context, state) {
            final SymptomReportState checkupState = state;

            return WidgetHUD(
              showHUD: _showLoadingAssessmentHUD,
              hud: HUD(
                color: Theme.of(context).colorScheme.surface,
                opacity: 1.0,
                labelStyle: Theme.of(context).textTheme.headline,
                label: localizations.systemReportLoadingAssessment,
              ),
              builder: (context) {
                return ChangeNotifierProvider<PageController>.value(
                  value: _pageController,
                  child: Scaffold(
                    appBar: AppBar(
                      title:
                          Text(AppLocalizations.of(context).checkupScreenTitle),
                      leading: IconButton(
                        icon: Icon(Icons.close),
                        onPressed: () => Navigator.pop(context),
                        tooltip: localizations.systemReportBackToHomePage,
                      ),
                    ),
                    backgroundColor: Theme.of(context).backgroundColor,
                    body: NetworkUnavailableBanner.wrap(
                      _getBody(preferencesState, checkupState),
                    ),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
