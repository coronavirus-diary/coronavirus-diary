import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'package:covidnearme/src/blocs/preferences/preferences.dart';
import 'package:covidnearme/src/ui/widgets/network_unavailable_banner.dart';
import 'tutorial_controller.dart';
import 'steps/index.dart';

final tutorialPageList = <Widget>[
  TutorialIntroStep(),
  TutorialLocationStep(),
];

class TutorialScreen extends StatefulWidget {
  static const routeName = '/tutorial';

  @override
  _TutorialScreenState createState() => _TutorialScreenState();
}

class _TutorialScreenState extends State<TutorialScreen> {
  PageController _pageController;
  TutorialController _tutorialController;

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

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PreferencesBloc, PreferencesState>(
      builder: (context, state) {
        return WillPopScope(
          onWillPop: () => Future.value(false),
          child: Theme(
            data: _getTutorialTheme(context),
            child: Scaffold(
              body: Provider<TutorialController>.value(
                value: _tutorialController = TutorialController(
                  context: context,
                  totalPages: tutorialPageList.length,
                  pageController: _pageController,
                  preferencesState: state,
                ),
                child: NetworkUnavailableBanner.wrap(
                  PageView(
                    physics: NeverScrollableScrollPhysics(),
                    controller: _tutorialController.pageController,
                    children: tutorialPageList,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

ThemeData _getTutorialTheme(BuildContext context) {
  return Theme.of(context).copyWith(
    primaryColor: Colors.white,
    scaffoldBackgroundColor: Theme.of(context).primaryColor,
    buttonTheme: Theme.of(context).buttonTheme.copyWith(
          buttonColor: Theme.of(context).accentColor,
        ),
    iconTheme: Theme.of(context).iconTheme.copyWith(
          color: Colors.white,
        ),
    textTheme: Theme.of(context).textTheme.copyWith(
          button: Theme.of(context).textTheme.button.copyWith(
                color: Colors.white,
              ),
          headline: Theme.of(context).textTheme.headline.copyWith(
                color: Colors.white,
              ),
          title: Theme.of(context).textTheme.title.copyWith(
                color: Colors.white,
              ),
          subhead: Theme.of(context).textTheme.subhead.copyWith(
                color: Colors.white,
              ),
          body1: Theme.of(context).textTheme.body1.copyWith(
                color: Colors.white,
              ),
          body2: Theme.of(context).textTheme.body2.copyWith(
                color: Colors.white,
              ),
          display1: Theme.of(context).textTheme.display1.copyWith(
                color: Colors.white,
              ),
          display2: Theme.of(context).textTheme.display2.copyWith(
                color: Colors.white,
              ),
          display3: Theme.of(context).textTheme.display3.copyWith(
                color: Colors.white,
              ),
          display4: Theme.of(context).textTheme.display4.copyWith(
                color: Colors.white,
              ),
        ),
    inputDecorationTheme: Theme.of(context).inputDecorationTheme.copyWith(
          border: Theme.of(context).inputDecorationTheme.border.copyWith(
              borderSide: Theme.of(context)
                  .inputDecorationTheme
                  .border
                  .borderSide
                  .copyWith(color: Colors.white)),
          enabledBorder: Theme.of(context)
              .inputDecorationTheme
              .enabledBorder
              .copyWith(
                  borderSide: Theme.of(context)
                      .inputDecorationTheme
                      .enabledBorder
                      .borderSide
                      .copyWith(color: Colors.white)),
          focusColor: Colors.white,
          labelStyle:
              Theme.of(context).inputDecorationTheme.labelStyle.copyWith(
                    color: Colors.white,
                  ),
        ),
  );
}
