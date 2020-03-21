import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hud/flutter_hud.dart';
import 'package:provider/provider.dart';

import 'package:coronavirus_diary/src/blocs/checkup/checkup.dart';
import 'package:coronavirus_diary/src/blocs/preferences/preferences.dart';
import 'package:coronavirus_diary/src/ui/router.dart';
import 'package:coronavirus_diary/src/ui/widgets/loading_indicator.dart';
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
      context.bloc<CheckupBloc>().add(StartCheckup());
    }
    return LoadingIndicator('Loading your health checkup');
  }

  Widget _getErrorBody() {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Text(
          'There was an error retrieving the checkup experience. Please try again later.',
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
      case CheckupStateCompleting:
        return CheckupLoadedBody();
      case CheckupStateCompleted:
        _handleCheckupCompletion(preferencesState, checkupState);
        return null;
      default:
        return _getErrorBody();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PreferencesBloc, PreferencesState>(
      builder: (context, state) {
        final PreferencesState preferencesState = state;

        return BlocBuilder<CheckupBloc, CheckupState>(
          builder: (context, state) {
            final CheckupState checkupState = state;

            return WidgetHUD(
              showHUD: checkupState is CheckupStateCompleting,
              hud: HUD(label: 'Loading your assessment'),
              builder: (context) {
                return ChangeNotifierProvider<PageController>.value(
                  value: _pageController,
                  child: Scaffold(
                    appBar: AppBar(
                      title: Text('Your Health Checkup'),
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
