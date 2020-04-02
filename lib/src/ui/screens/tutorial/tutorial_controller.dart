import 'package:flutter/material.dart';

import 'package:covidnearme/src/ui/router.dart';

class TutorialController {
  int totalPages;
  PageController pageController;
  BuildContext context;

  TutorialController({
    this.totalPages,
    this.pageController,
    this.context,
  });

  void next() {
    if (pageController.page < totalPages - 1) {
      // Advance to the next page
      pageController.nextPage(
        duration: Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    } else {
      // Last page: navigate to home page and put it at the
      // bottom of the navigation stack.
      Navigator.pushNamedAndRemoveUntil(
        context,
        HomeScreen.routeName,
        (Route<dynamic> route) => false,
      );
    }
  }

  void previous() {
    // Go back to the previous page
    pageController.previousPage(
      duration: Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }
}
