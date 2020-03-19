import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'package:coronavirus_diary/src/blocs/checkup/checkup.dart';
import 'package:coronavirus_diary/src/blocs/questions/questions.dart';
import 'package:coronavirus_diary/src/ui/widgets/loading_indicator.dart';
import 'steps/index.dart';

class CheckupScreen extends StatelessWidget {
  static const routeName = '/checkup';

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CheckupBloc>(
      create: (context) => CheckupBloc(),
      child: CheckupScreenBody(),
    );
  }
}

class CheckupScreenBody extends StatefulWidget {
  @override
  _CheckupScreenBodyState createState() => _CheckupScreenBodyState();
}

class _CheckupScreenBodyState extends State<CheckupScreenBody> {
  PageController _pageController;
  int currentIndex = 0;
  CheckupStep currentStep = steps[0];

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

  void _handlePageChange(int index) {
    setState(() {
      currentIndex = index;
      currentStep = steps[index];
    });

    if (currentIndex > 1) {
      context.bloc<CheckupBloc>().add(UpdateRemoteCheckup());
    }
  }

  Widget _getUnloadedBody(QuestionsState state) {
    if (state is QuestionsStateNotLoaded) {
      context.bloc<QuestionsBloc>().add(LoadQuestions());
    }
    return LoadingIndicator('Loading checkup');
  }

  Widget _getProgressBar(QuestionsState state) {
    double percentComplete = (currentIndex) / (steps.length - 1);
    bool isLastPage = currentIndex == steps.length - 1;

    // Remember to update this if steps are added that do not count towards the total
    String percentCompleteText = 'Step ${currentIndex} of ${steps.length - 1}';

    return Align(
      alignment: Alignment.bottomCenter,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  percentCompleteText,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                RaisedButton(
                  onPressed: () => _pageController.nextPage(
                    duration: Duration(milliseconds: 400),
                    curve: Curves.easeInOut,
                  ),
                  child: Text(isLastPage ? 'Submit' : 'Continue'),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
            child: LinearProgressIndicator(
              value: percentComplete,
              backgroundColor: Colors.white.withOpacity(0.2),
              valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
            ),
          ),
        ],
      ),
    );
  }

  Widget _getLoadedBody(QuestionsState state) {
    return Stack(
      children: <Widget>[
        PageView.builder(
          controller: _pageController,
          onPageChanged: _handlePageChange,
          itemCount: steps.length,
          itemBuilder: (BuildContext context, int index) {
            return steps[index];
          },
        ),
        if (currentStep != null && currentIndex > 0) _getProgressBar(state),
      ],
    );
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

  Widget _getBody(QuestionsState state) {
    if (state is QuestionsStateNotLoaded || state is QuestionsStateLoading) {
      return _getUnloadedBody(state);
    } else if (state is QuestionsStateLoaded && state.questions.length > 0) {
      return _getLoadedBody(state);
    } else {
      return _getErrorBody(state);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CheckupBloc>(
      create: (context) => CheckupBloc(),
      child: BlocBuilder<QuestionsBloc, QuestionsState>(
        builder: (context, state) {
          return ChangeNotifierProvider<PageController>(
            create: (context) => _pageController,
            child: Scaffold(
              appBar: AppBar(
                title: Text('Your Health Checkup'),
              ),
              backgroundColor: Theme.of(context).primaryColor,
              body: _getBody(state),
            ),
          );
        },
      ),
    );
  }
}
