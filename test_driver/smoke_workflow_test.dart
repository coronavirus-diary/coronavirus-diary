import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

// Note: the tests in this file require running in order.
void main() {
  FlutterDriver driver;

  setUp(() async {
    driver = await FlutterDriver.connect();
  });

  test('User can reach checkup and share screen', () async {
    // The welcome screen shows a "learn more" button.
    final learnMoreButton = find.text('Click here to learn more');
    await driver.tap(learnMoreButton);

    // The agree to terms screen shows an "agree" and "no" button.
    final agreeButton = find.text('I agree');
    await driver.tap(agreeButton);

    // Click here to get started page.
    final getStartedButton = find.text('Click here to get started');
    await driver.tap(getStartedButton);

    // The main options selection screen has a share and a checkup option.
    final shareButton = find.text('Share now');
    await driver.waitFor(shareButton);

    final checkupButton = find.text('Check up on your health');
    await driver.waitFor(checkupButton);
  });

  test('User can go back from the checkup screen to home', () async {
    // From state above, proceede to checkup screen.
    final checkupButton = find.text('Check up on your health');
    await driver.tap(checkupButton);

    // Click on the close button.
    final closeButton = find.byTooltip('Go back to the home page.');
    await driver.tap(closeButton);

    // Back on the home screen.
    await driver.waitFor(find.text('Check up on your health'));
  });

  test('User can checkup on their health', () async {
    // From state above, proceede to checkup screen.
    final checkupButton = find.text('Check up on your health');
    await driver.tap(checkupButton);

    // The first screen says "Its time for your checkup."
    // No actions need to be taken.
    final startCheckup = find.text('Start checkup');
    await driver.tap(startCheckup);

    // There are three preconfigured questions:
    // 1. Shortness of breath
    // 2. cough
    // 3. fever
    // These will need value keys or other labels so the driver test
    // c an confirm that values update correctly.
    await driver.tap(find.text('Continue'));

    // Take your temperature is a text entry that
    // does not require any values.
    await driver.tap(find.text('Submit'));

    // Finally, there is a progress screen and a contact screen.
    await driver.waitFor(find.text('Stay Safe'));
  }, skip: true); // This test can't run due to location permission dialog.

  test('User can tap on delete data and back to the first page', () async {
    // Click on the delete data button.
    final deleteDataButton = find.byTooltip('DEBUG MODE ONLY: Clear user data');
    await driver.tap(deleteDataButton);

    // Back to the welcome screen.
    await driver.waitFor(find.text('Welcome to the CovidNearMe App'));
  });

  tearDown(() async {
    await driver?.close();
  });
}
