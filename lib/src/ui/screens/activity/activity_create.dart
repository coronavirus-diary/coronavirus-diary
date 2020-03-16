import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:moor/moor.dart' as moor;

import 'package:coronavirus_diary/src/data/database/database.dart';
import 'package:coronavirus_diary/src/blocs/activity/activity.dart';

class ActivityCreateScreen extends StatefulWidget {
  static const routeName = '/activity/create';

  @override
  _ActivityCreateScreenState createState() => _ActivityCreateScreenState();
}

class _ActivityCreateScreenState extends State<ActivityCreateScreen> {
  Position _currentPosition;

  void _saveActivity(BuildContext context) async {
    await context.bloc<ActivityBloc>().add(
          AddActivity(
            locationEntry: LocationsCompanion(
              lat: moor.Value(_currentPosition.latitude),
              long: moor.Value(_currentPosition.longitude),
              accuracy: moor.Value(_currentPosition.accuracy),
              altitude: moor.Value(_currentPosition.altitude),
            ),
            activityEntry: ActivitiesCompanion(),
          ),
        );
    Navigator.pop(context);
  }

  void _getCurrentLocation() {
    final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;

    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
      });
    }).catchError((e) {
      print(e);
    });
  }

  @override
  Widget build(BuildContext context) {
    _getCurrentLocation();
    return Scaffold(
      appBar: AppBar(
        title: Text('Record activity'),
        actions: <Widget>[
          IconButton(
            onPressed: () => _saveActivity(context),
            icon: FaIcon(
              FontAwesomeIcons.save,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Text(_currentPosition.toString()),
            TextFormField(),
          ],
        ),
      ),
    );
  }
}
