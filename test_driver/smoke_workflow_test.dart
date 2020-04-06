import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

// Note: the tests in this file require running in order.
void main() {
  FlutterDriver driver;

  setUpAll(() async {
    driver = await FlutterDriver.connect();
    await Future.delayed(const Duration(seconds: 5));
    await driver.waitUntilFirstFrameRasterized();
  });

  tearDownAll(() async {
    if (driver != null) {
      await driver.close();
    }
  });

  test('User can complete tutorial', () async {
    // Tap next on the tutorial screen
    await driver.tap(find.byValueKey('tutorialIntroStepContinueButton'));

    // Enter location and tap next
    await driver.tap(find.byValueKey('ZIP Code'));
    await driver.enterText('98101');
    await driver.tap(find.byValueKey('tutorialLocationStepContinueButton'));
  });

  Future<void> enterSymptomReport({bool consent = false}) async {
    // Restart symptom report process
    await driver.tap(find.byValueKey('homeScreenStartSymptomReport'));
    await driver.tap(find.byValueKey('symptomReportIntroStepContinueButton'));

    // If still need to accept the consent, agree.
    if (consent) {
      await driver.tap(find.byValueKey('symptomReportInformedConsentAcceptButton'));
    }

    // Enter a location and continue
    await driver.tap(find.byValueKey('stepFinishedButton'));

    // Answer the questions
    // TODO(gspencergoog): The individual questions will need value keys or
    // other labels so the driver test can confirm that values update correctly.

    // Continue.
    await driver.scrollUntilVisible(
      find.byValueKey('ScrollableBody'),
      find.byValueKey('stepFinishedButton'),
      dyScroll: -100,
    );
    await driver.tap(find.byValueKey('stepFinishedButton'));

    // Ensure that thank you page is shown.
    await driver.waitFor(find.byValueKey('symptomReportThankYouScreen'));

    await driver.scrollUntilVisible(
      find.byValueKey('ScrollableBody'),
      find.byValueKey('symptomReportThankYouFinishButton'),
      dyScroll: -100,
    );
    await driver.tap(find.byValueKey('symptomReportThankYouFinishButton'));
    await driver.waitFor(find.byValueKey('homeScreen'));
  }

  test('User can complete a symptom report', () async {
    // From state above, proceed to symptom report screen.
    await driver.tap(find.byValueKey('homeScreenStartSymptomReport'));

    // Intro screen is shown, continue
    await driver.tap(find.byValueKey('symptomReportIntroStepContinueButton'));

    // Informed consent screen is shown, don't accept
    await driver.tap(
      find.byValueKey('symptomReportInformedConsentRejectButton'),
    );

    // Consent declined screen is shown, close it
    await driver.tap(find.byValueKey('symptomReportConsentDeniedCloseButton'));

    await enterSymptomReport(consent: true);
  });

  test('User can enter a second report', () async {
    await enterSymptomReport(consent: false);
  });

  test('User can tap on delete data and go back to the tutorial', () async {
    // Open the menu and tap on the delete data button.
    await driver.tap(find.byValueKey('homeScreenMenuButton'));
    await driver.tap(find.byValueKey('homeScreenDebugDeleteDataButton'));

    // Ensure that we are back at the welcome screen.
    await driver.waitFor(find.byValueKey('tutorialIntroStep'));
  });
}
