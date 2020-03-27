import 'package:app_settings/app_settings.dart';
import 'package:connectivity/connectivity.dart';
import 'package:covidnearme/src/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

/// Displays a [MaterialBanner] when network connectivity is lost.
class NetworkUnavailableBanner extends StatefulWidget {
  final Connectivity connectivity;
  final bool dismissible;

  NetworkUnavailableBanner({this.connectivity, this.dismissible = false});

  /// Displays a [NetworkUnavailableBanner] above [widget] when network
  /// connectivity is lost.
  static Widget wrap(Widget widget) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          NetworkUnavailableBanner(),
          Expanded(
            child: widget,
          ),
        ],
      ),
    );
  }

  @override
  _NetworkUnavailableBannerState createState() =>
      _NetworkUnavailableBannerState();
}

class _NetworkUnavailableBannerState extends State<NetworkUnavailableBanner> {
  // If the user has dismissed the banner, don't show it again throughout the
  // app unless they've lost network connection again.
  static bool _dismissed = false;

  Connectivity _connectivity;
  ConnectivityResult _lastConnectivity;
  Future<ConnectivityResult> _initialConnectivity;

  @override
  void initState() {
    _connectivity = widget.connectivity ?? Connectivity();
    _initialConnectivity = _connectivity.checkConnectivity();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ConnectivityResult>(
      future: _initialConnectivity,
      builder: (
        BuildContext context,
        AsyncSnapshot<ConnectivityResult> currentConnectivity,
      ) {
        if (!currentConnectivity.hasData) return Container();
        return StreamBuilder<ConnectivityResult>(
          stream: _connectivity.onConnectivityChanged,
          initialData: currentConnectivity.data,
          builder: (
            BuildContext context,
            AsyncSnapshot<ConnectivityResult> snapshot,
          ) {
            final connectivityResult = snapshot.data;
            if ((connectivityResult == ConnectivityResult.none) &&
                connectivityResult != _lastConnectivity) {
              // Reset the banner dismiss state if we've lost network
              // connection again.
              _dismissed = false;
            }
            _lastConnectivity = connectivityResult;
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ((connectivityResult == ConnectivityResult.none) && !_dismissed)
                    ? MaterialBanner(
                        backgroundColor: Theme.of(context).appBarTheme.color,
                        contentTextStyle:
                            Theme.of(context).dialogTheme.contentTextStyle,
                        content: Column(
                          children: <Widget>[
                            Container(
                              child: Text(
                                AppLocalizations.of(context)
                                    .networkUnavailableBannerMessage,
                                textAlign: TextAlign.start,
                                style: Theme.of(context)
                                    .dialogTheme
                                    .contentTextStyle
                                    .apply(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                        leading: FaIcon(
                          Icons.network_check,
                          color: Colors.white,
                          size: 40,
                        ),
                        actions: <Widget>[
                          // Only show "CONTINUE OFFLINE" when offline support is enabled.
                          if (widget.dismissible)
                            FlatButton(
                              child: Text(
                                AppLocalizations.of(context)
                                    .networkUnavailableBannerContinueOffline,
                              ),
                              onPressed: () async =>
                                  setState(() => _dismissed = true),
                            ),
                          FlatButton(
                            child: Text(
                              AppLocalizations.of(context)
                                  .networkUnavailableBannerConnectToWiFi,
                            ),
                            onPressed: () async =>
                                await AppSettings.openWIFISettings(),
                          )
                        ],
                      )
                    : Container(
                        height: 0,
                      ),
              ],
            );
          },
        );
      },
    );
  }
}
