import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'package:coronavirus_diary/src/blocs/preferences/preferences.dart';
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
    return BlocBuilder<PreferencesBloc, PreferencesState>(
      builder: (context, state) {
        return Scaffold(
          body: ChangeNotifierProvider(
            create: (context) => _pageController,
            child: PageView(
              controller: _pageController,
              children: <Widget>[
                IntroStep(),
                ConsentStep(),
                if (state.preferences.agreedToTerms == true) GetStartedStep(),
              ],
            ),
          ),
        );
      },
    );
  }
}
