import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'package:covidnearme/src/blocs/checkup/checkup.dart';

typedef bool ReadyToContinueCallback();
typedef String NotReadyToContinueMessage();

class CheckupProgressBar extends StatelessWidget {
  final int currentIndex;
  final int stepsLength;
  final bool isLastPage;
  final double percentComplete;
  final ReadyToContinueCallback isReadyToContinue;
  final NotReadyToContinueMessage getNotReadyToContinueMessage;

  const CheckupProgressBar({
    this.currentIndex,
    this.stepsLength,
    this.isReadyToContinue,
    this.getNotReadyToContinueMessage,
  })  : isLastPage = currentIndex == stepsLength - 1,
        percentComplete = (currentIndex) / (stepsLength - 1);

  _handleNextButton(BuildContext context) {
    if (isReadyToContinue != null && !isReadyToContinue()) {
      _showNotReadyDialog(context);
      return;
    }
    if (isLastPage) {
      context.bloc<CheckupBloc>().add(CompleteCheckup());
    } else {
      Provider.of<PageController>(context, listen: false).nextPage(
        duration: Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  _showNotReadyDialog(BuildContext context) {
    if (Platform.isIOS) {
      showCupertinoDialog(
          context: context,
          builder: (BuildContext context) => CupertinoAlertDialog(
                title: Text(getNotReadyToContinueMessage()),
                actions: <Widget>[
                  CupertinoDialogAction(
                    child: Text(
                      'OK',
                    ),
                    onPressed: () => Navigator.of(context).pop(),
                  )
                ],
              ));
    } else {
      showGeneralDialog(
          context: context,
          pageBuilder: (BuildContext context, Animation animation,
                  Animation<double> secondaryAnimation) =>
              AlertDialog(
                title: Text(getNotReadyToContinueMessage()),
                actions: <Widget>[
                  FlatButton(
                    child: Text(
                      'OK',
                    ),
                    onPressed: () => Navigator.of(context).pop(),
                  )
                ],
              ));
    }
  }

  @override
  Widget build(BuildContext context) {
    // Remember to update this if steps are added that do not count towards the total
    String percentCompleteText = 'Step ${currentIndex} of ${stepsLength - 1}';

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
                  onPressed: () => _handleNextButton(context),
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
}
