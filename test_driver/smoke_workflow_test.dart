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

  test('User can reach checkup and share screen', () async {
    // The welcome screen shows a "get started" button.
    await driver.tap(find.text('GET STARTED'));

    // The agree to terms screen shows an "agree" and "no" button.
    // Click "no" the first time.
    await driver.tap(find.text('NO'));

    // Click here to get started page.
    await driver.waitFor(find.text('Consent Declined'));

    // Click on the close button.
    await driver.tap(find.byTooltip('Go back to the informed consent screen'));

    // Back on the informed consent screen.
    await driver.waitFor(find.text('DID NOT AGREE'));

    // Now agree.
    await driver.tap(find.text('I AGREE'));

    // Now submit an empty default location.
    await driver.tap(find.text('SUBMIT'));
  });

  test('User can go back from the checkup screen to home', () async {
    await driver.scrollUntilVisible(
      find.byType('SingleChildScrollView'),
      find.byValueKey('SHARE NOW'),
      dyScroll: -100,
    );
    await driver.tap(find.byValueKey('START HEALTH CHECKUP'));
    await driver.waitFor(find.text('START CHECKUP'));
    await driver.tap(find.byTooltip('Go back to the home page'));
    await driver.waitFor(find.byValueKey('START HEALTH CHECKUP'));
  });

  test('User can checkup on their health', () async {
    // From state above, proceed to checkup screen.
    await driver.tap(find.byValueKey('START HEALTH CHECKUP'));

    // The first screen says "Its time for your checkup."
    // No actions need to be taken.
    await driver.tap(find.text('START CHECKUP'));

    // TODO(gspencergoog): The individual questions will need value keys or
    // other labels so the driver test can confirm that values update correctly.

    // Can't tap the NEXT button until it's visible.
    await driver.scrollUntilVisible(
      find.byValueKey('ScrollableBody'),
      find.text('NEXT'),
      dyScroll: -100,
    );
    await driver.tap(find.text('NEXT'));

    // Can't tap the NEXT button until it's visible.
    await driver.scrollUntilVisible(
      find.byValueKey('ScrollableBody'),
      find.text('NEXT'),
      dyScroll: -100,
    );
    await driver.tap(find.text('NEXT'));

    // Take your temperature is a text entry that does not require any values.
    await driver.tap(find.text('SUBMIT'));

    // Finally, there is a progress screen and a contact screen.
    await driver.waitFor(find.text('Stay Safe'));
  });

  test('User can tap on delete data and back to the first page', () async {
    // Go back to the home page.
    await driver.tap(find.byTooltip('Return to home'));

    // Click on the delete data button.
    await driver.tap(find.byTooltip('DEBUG MODE ONLY: Clear user data'));

    // Back to the welcome screen.
    await driver.waitFor(find.text('Welcome to CovidNearMe'));
  });
}
