import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:coronavirus_diary/src/blocs/questions/questions.dart';
import 'package:coronavirus_diary/src/ui/widgets/loading_indicator.dart';
import 'steps/index.dart';

class CheckupScreen extends StatefulWidget {
  static const routeName = '/checkup';

  @override
  _CheckupScreenState createState() => _CheckupScreenState();
}

class _CheckupScreenState extends State<CheckupScreen> {
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
    _pageController.dispose();
    super.dispose();
  }

  Widget _getUnloadedBody(QuestionsState state) {
    if (state is QuestionsStateNotLoaded) {
      context.bloc<QuestionsBloc>().add(LoadQuestions());
    }
    return LoadingIndicator('Loading checkup');
  }

  Widget _getLoadedBody(QuestionsState state) {
    double percentComplete = currentIndex / steps.length;
    String percentCompleteText = (percentComplete * 100).round().toString();

    return Stack(
      children: <Widget>[
        PageView.builder(
          controller: _pageController,
          onPageChanged: (int index) => setState(() {
            currentIndex = index;
            currentStep = steps[index];
          }),
          itemCount: steps.length,
          itemBuilder: (BuildContext context, int index) {
            return steps[index];
          },
        ),
        if (currentStep != null)
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  onPressed: () => _pageController.nextPage(
                    duration: Duration(milliseconds: 400),
                    curve: Curves.easeInOut,
                  ),
                  child: Text('Continue'),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    '$percentCompleteText% Complete',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
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
          ),
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
    return BlocBuilder<QuestionsBloc, QuestionsState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Checkup time!'),
          ),
          backgroundColor: Theme.of(context).primaryColor,
          body: _getBody(state),
        );
      },
    );
  }
}
