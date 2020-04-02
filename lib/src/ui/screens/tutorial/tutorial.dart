import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:covidnearme/src/ui/widgets/network_unavailable_banner.dart';

import 'steps/index.dart';
import 'tutorial_controller.dart';

final tutorialPageList = <Widget>[
  IntroStep(),
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
    _tutorialController = TutorialController(
      context: context,
      totalPages: tutorialPageList.length,
      pageController: _pageController,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Scaffold(
        body: Provider<TutorialController>.value(
          value: _tutorialController,
          child: NetworkUnavailableBanner.wrap(
            PageView(
              physics: NeverScrollableScrollPhysics(),
              controller: _tutorialController.pageController,
              children: tutorialPageList,
            ),
          ),
        ),
      ),
    );
  }
}
