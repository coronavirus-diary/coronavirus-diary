import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'package:covidnearme/src/blocs/preferences/preferences.dart';
import 'package:covidnearme/src/ui/widgets/network_unavailable_banner.dart';
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
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PreferencesBloc, PreferencesState>(
      builder: (context, state) {
        return Scaffold(
          body: ChangeNotifierProvider<PageController>.value(
            value: _pageController,
            child: NetworkUnavailableBanner.wrap(
              PageView(
                physics: NeverScrollableScrollPhysics(),
                controller: _pageController,
                children: <Widget>[
                  IntroStep(),
                  ConsentStep(),
                  if (state.preferences.agreedToTerms == false) DeniedConsent(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
