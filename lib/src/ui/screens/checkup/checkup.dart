import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hud/flutter_hud.dart';
import 'package:provider/provider.dart';

import 'package:covidnearme/src/blocs/checkup/checkup.dart';
import 'package:covidnearme/src/blocs/preferences/preferences.dart';
import 'package:covidnearme/src/l10n/app_localizations.dart';
import 'package:covidnearme/src/ui/router.dart';
import 'package:covidnearme/src/ui/widgets/loading_indicator.dart';
import 'checkup_loaded_body.dart';

class CheckupScreen extends StatefulWidget {
  static const routeName = '/checkup';

  @override
  _CheckupScreenState createState() => _CheckupScreenState();
}

class _CheckupScreenState extends State<CheckupScreen> {
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
    CheckupState checkupState,
  ) {
    if (checkupState is CheckupStateNotCreated) {
      context.bloc<CheckupBloc>().add(const StartCheckup());
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
    CheckupStateCompleted checkupState,
  ) {
    // Remember assessment
    if (preferencesState.preferences.lastAssessment !=
        checkupState.assessment) {
      Preferences newPreferences = preferencesState.preferences.cloneWith(
        lastAssessment: checkupState.assessment,
      );
      context.bloc<PreferencesBloc>().add(UpdatePreferences(newPreferences));
    }

    // Navigate to assessment view
    Navigator.pushReplacementNamed(
      context,
      AssessmentScreen.routeName,
      arguments: AssessmentScreenArguments(
        assessment: checkupState.assessment,
      ),
    );
  }

  Widget _getBody(
    PreferencesState preferencesState,
    CheckupState checkupState,
  ) {
    switch (checkupState.runtimeType) {
      case CheckupStateNotCreated:
      case CheckupStateCreating:
        return _getUnloadedBody(checkupState);
      case CheckupStateInProgress:
        return CheckupLoadedBody();
      case CheckupStateCompleting:
      case CheckupStateCompleted:
        return Container();
      default:
        return _getErrorBody();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PreferencesBloc, PreferencesState>(
      builder: (context, state) {
        final PreferencesState preferencesState = state;

        return BlocConsumer<CheckupBloc, CheckupState>(
          listener: (context, state) {
            if (state is CheckupStateCompleting) {
              if (!_showLoadingAssessmentHUD) {
                setState(() {
                  _showLoadingAssessmentHUD = true;
                });
              }
            } else if (state is CheckupStateCompleted) {
              _handleCheckupCompletion(preferencesState, state);
            }
          },
          builder: (context, state) {
            final CheckupState checkupState = state;

            return WidgetHUD(
              showHUD: _showLoadingAssessmentHUD,
              hud: HUD(label: 'Loading your assessment'),
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
                      ),
                    ),
                    backgroundColor: Theme.of(context).primaryColor,
                    body: _getBody(preferencesState, checkupState),
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
