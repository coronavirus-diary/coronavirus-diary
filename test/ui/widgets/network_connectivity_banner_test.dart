import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:covidnearme/src/l10n/app_localizations.dart';
import 'package:covidnearme/src/ui/assets/theme.dart';
import 'package:covidnearme/src/ui/widgets/network_unavailable_banner.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

void main() {
  group('NetworkUnavailableBanner appears when network connection is lost', () {
    FakeConnectivity connectivity;
    setUp(() {
      connectivity = FakeConnectivity();
    });

    Future<void> testBannerAppears(WidgetTester tester) async {
      await tester.pumpWidget(
        setUpConfiguration(
          NetworkUnavailableBanner(
            connectivity: connectivity,
            dismissible: true,
          ),
        ),
      );

      // With connectivity, the banner is not displayed.
      expect(find.byType(Container), findsOneWidget);

      // Ensure banner appears once connectivity is lost.
      connectivity.changeConnectivity(ConnectivityResult.none);
      await tester.pumpAndSettle();
      expect(find.byType(MaterialBanner), findsOneWidget);
    }

    Future<void> testLostConnectivity(WidgetTester tester) async {
      connectivity.changeConnectivity(ConnectivityResult.none);
      await tester.pumpAndSettle();
      expect(find.byType(MaterialBanner), findsOneWidget);
    }

    Future<void> testRestoredConnectivity(WidgetTester tester) async {
      // Restore connectivity (use mobile connectivity to exhaust our options).
      connectivity.changeConnectivity(ConnectivityResult.mobile);
      await tester.pumpAndSettle();
      expect(find.byType(MaterialBanner), findsNothing);
    }

    Future<void> testDismissBanner(WidgetTester tester) async {
      // Dismiss the banner.
      final l10n = await AppLocalizations.delegate.load(Locale('en'));
      await tester.tap(find.text(l10n.networkUnavailableBannerContinueOffline));
      await tester.pumpAndSettle();
      expect(find.byType(MaterialBanner), findsNothing);
      expect(find.byType(Container), findsOneWidget);
    }

    testWidgets('and is dismissible', (tester) async {
      await testBannerAppears(tester);
      await testDismissBanner(tester);
    });

    testWidgets('and is dismissible multiple times', (tester) async {
      await testBannerAppears(tester);
      await testDismissBanner(tester);
      await testRestoredConnectivity(tester);
      await testLostConnectivity(tester);
      await testDismissBanner(tester);
    });

    testWidgets('and disappears when connectivity is restored', (tester) async {
      await testBannerAppears(tester);
      await testRestoredConnectivity(tester);
    });

    testWidgets('before widget is created', (tester) async {
      connectivity = FakeConnectivity(ConnectivityResult.none);
      await tester.pumpWidget(
        setUpConfiguration(
          NetworkUnavailableBanner(
            connectivity: connectivity,
          ),
        ),
      );
      await tester.pumpAndSettle();
      expect(find.byType(MaterialBanner), findsOneWidget);
    });
  });
}

Widget setUpConfiguration(Widget child) {
  return MaterialApp(
    home: Scaffold(body: child),
    localizationsDelegates: AppLocalizations.localizationsDelegates,
    supportedLocales: AppLocalizations.supportedLocales,
    theme: appTheme,
  );
}

class FakeConnectivity extends Fake implements Connectivity {
  FakeConnectivity([this._currentConnectivity = ConnectivityResult.wifi]);
  ConnectivityResult _currentConnectivity = ConnectivityResult.wifi;
  final _connectivityStream = StreamController<ConnectivityResult>();

  void changeConnectivity(ConnectivityResult connectivity) {
    _currentConnectivity = connectivity;
    _connectivityStream.add(connectivity);
  }

  @override
  Future<ConnectivityResult> checkConnectivity() async => _currentConnectivity;

  @override
  Stream<ConnectivityResult> get onConnectivityChanged =>
      _connectivityStream.stream;
}
