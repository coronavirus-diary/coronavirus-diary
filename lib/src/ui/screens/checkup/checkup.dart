import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    double percentComplete = currentIndex / steps.length;
    String percentCompleteText = (percentComplete * 100).round().toString();

    return Scaffold(
      appBar: AppBar(
        title: Text('Checkup time!'),
      ),
      backgroundColor: Theme.of(context).primaryColor,
      body: Stack(
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
      ),
    );
  }
}
