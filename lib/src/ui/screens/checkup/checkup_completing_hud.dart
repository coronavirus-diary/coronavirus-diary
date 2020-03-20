import 'package:flutter/material.dart';
import 'package:flutter_hud/flutter_hud.dart';

class CheckupCompletingHUD extends StatelessWidget {
  final Widget Function(BuildContext) builder;
  final bool show;

  const CheckupCompletingHUD({
    this.builder,
    this.show,
  });

  @override
  Widget build(BuildContext context) {
    return WidgetHUD(
      showHUD: show,
      builder: builder,
      hud: HUD(
        label: 'Retrieving your assessment',
      ),
    );
  }
}
