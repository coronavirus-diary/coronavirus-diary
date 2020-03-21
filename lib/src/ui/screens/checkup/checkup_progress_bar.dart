import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:coronavirus_diary/src/ui/router.dart';

class CheckupProgressBar extends StatelessWidget {
  final int currentIndex;
  final int stepsLength;

  const CheckupProgressBar({
    this.currentIndex,
    this.stepsLength,
  });

  _handleNextButton(BuildContext context) {
    bool isLastPage = currentIndex == stepsLength - 1;
    if (isLastPage) {
      Navigator.pushReplacementNamed(context, AssessmentScreen.routeName);
    } else {
      Provider.of<PageController>(context, listen: false).nextPage(
        duration: Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double percentComplete = (currentIndex) / (stepsLength - 1);
    bool isLastPage = currentIndex == stepsLength - 1;

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
