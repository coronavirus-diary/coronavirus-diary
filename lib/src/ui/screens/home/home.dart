import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:coronavirus_diary/src/blocs/preferences/preferences.dart';
import 'package:coronavirus_diary/src/ui/router.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget _getTrackingTile(PreferencesState state) {
    Widget title;
    Widget subtitle;
    if (state.preferences.trackLocation) {
      title = Text('Automatically recording location');
      subtitle = Text('Description text');
    } else {
      title = Text('Automatically record location');
      subtitle = Text('Description text');
    }
    return SwitchListTile(
      title: title,
      subtitle: subtitle,
      value: state.preferences.trackLocation,
      onChanged: (bool value) {
        Preferences newPreferences = Preferences.clone(state.preferences);
        newPreferences.trackLocation = value;
        context.bloc<PreferencesBloc>().add(UpdatePreferences(newPreferences));
      },
      secondary: const FaIcon(
        FontAwesomeIcons.locationArrow,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PreferencesBloc, PreferencesState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Coronavirus Diary'),
          ),
          body: Column(
            children: <Widget>[
              Container(
                color: Color.fromRGBO(238, 238, 238, 1),
                child: _getTrackingTile(state),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        width: double.infinity,
                        child: RaisedButton(
                          onPressed: () => Navigator.pushNamed(
                              context, ActivityCreateScreen.routeName),
                          child: Text('Enter social activity'),
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: RaisedButton(
                          onPressed: () => Navigator.pushNamed(
                              context, ActivityScreen.routeName),
                          child: Text('View activities'),
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: RaisedButton(
                          onPressed: () => Navigator.pushNamed(
                              context, CheckupScreen.routeName),
                          child: Text('Start checkup'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
