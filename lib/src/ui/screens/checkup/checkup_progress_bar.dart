import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'package:covidnearme/src/blocs/checkup/checkup.dart';
import 'package:covidnearme/src/l10n/app_localizations.dart';

class CheckupProgressBar extends StatelessWidget {
  final int currentIndex;
  final int stepsLength;
  final bool isLastPage;
  final double percentComplete;

  const CheckupProgressBar({
    this.currentIndex,
    this.stepsLength,
  })  : isLastPage = currentIndex == stepsLength - 1,
        percentComplete = (currentIndex) / (stepsLength - 1);

  _handleNextButton(BuildContext context) {
    if (isLastPage) {
      context.bloc<CheckupBloc>().add(CompleteCheckup());
    } else {
      Provider.of<PageController>(context, listen: false).nextPage(
        duration: Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // Remember to update this if steps are added that do not count towards the total
    final AppLocalizations localizations = AppLocalizations.of(context);
    String percentCompleteText = localizations.checkupProgressBarPercentCompleteText(currentIndex, stepsLength);
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
                  child: Text(isLastPage
                    ? localizations.checkupProgressBarSubmit
                    : localizations.checkupProgressBarContinue),
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
