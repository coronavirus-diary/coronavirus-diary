import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'package:coronavirus_diary/src/blocs/checkup/checkup.dart';
import 'package:coronavirus_diary/src/blocs/preferences/preferences.dart';
import 'package:coronavirus_diary/src/blocs/questions/questions.dart';
import 'package:coronavirus_diary/src/ui/widgets/loading_indicator.dart';
import 'checkup_loaded_body.dart';

class CheckupScreen extends StatelessWidget {
  static const routeName = '/checkup';

  @override
  Widget build(BuildContext context) {
    // Initializing the bloc provider here so that the bloc is
    // accessible to all functions in the checkup screen body
    return BlocBuilder<PreferencesBloc, PreferencesState>(
      builder: (context, state) {
        return BlocProvider<CheckupBloc>(
          create: (context) => CheckupBloc(preferencesState: state),
          child: CheckupScreenBody(),
        );
      },
    );
  }
}

class CheckupScreenBody extends StatefulWidget {
  @override
  _CheckupScreenBodyState createState() => _CheckupScreenBodyState();
}

class _CheckupScreenBodyState extends State<CheckupScreenBody> {
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
    QuestionsState questionsState,
  ) {
    if (checkupState is CheckupStateNotCreated) {
      context.bloc<CheckupBloc>().add(StartCheckup());
    }
    if (questionsState is QuestionsStateNotLoaded) {
      context.bloc<QuestionsBloc>().add(LoadQuestions());
    }
    return LoadingIndicator('Loading your health checkup');
  }

  Widget _getErrorBody(QuestionsState state) {
    Widget errorBody;

    if (state is QuestionsStateLoaded && state.questions.length == 0) {
      errorBody = Text(
        'The checkup experience is not currently available. Please try again later.',
      );
    } else {
      errorBody = Text(
          'There was an error retrieving the checkup experience. Please try again later.');
    }

    return errorBody;
  }

  Widget _getBody(CheckupState checkupState, QuestionsState questionsState) {
    if (questionsState is QuestionsStateNotLoaded ||
        questionsState is QuestionsStateLoading ||
        checkupState is! CheckupStateInProgress) {
      return _getUnloadedBody(checkupState, questionsState);
    } else if (questionsState is QuestionsStateLoaded &&
        questionsState.questions.length > 0) {
      return CheckupLoadedBody();
    } else {
      return _getErrorBody(questionsState);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckupBloc, CheckupState>(
      builder: (context, state) {
        final CheckupState checkupState = state;

        return BlocBuilder<QuestionsBloc, QuestionsState>(
          builder: (context, state) {
            final QuestionsState questionsState = state;

            return ChangeNotifierProvider<PageController>(
              create: (context) => _pageController,
              child: Scaffold(
                appBar: AppBar(
                  title: Text('Your Health Checkup'),
                ),
                backgroundColor: Theme.of(context).primaryColor,
                body: _getBody(
                  checkupState,
                  questionsState,
                ),
              ),
            );
          },
        );
      },
    );
  }
}
