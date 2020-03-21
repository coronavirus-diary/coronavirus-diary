import 'package:flutter/material.dart';

import 'steps/index.dart';

class TutorialScreen extends StatefulWidget {
  static const routeName = '/tutorial';

  @override
  _TutorialScreenState createState() => _TutorialScreenState();
}

class _TutorialScreenState extends State<TutorialScreen> {
  PageController _pageController;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _pageController,
        itemCount: steps.length,
        itemBuilder: (BuildContext context, int index) {
          return steps[index];
        },
      ),
    );
  }
}
