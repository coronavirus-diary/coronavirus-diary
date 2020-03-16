import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/fa_icon.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';

class ActivityCreateScreen extends StatefulWidget {
  static const routeName = '/activity/create';

  @override
  _ActivityCreateScreenState createState() => _ActivityCreateScreenState();
}

class _ActivityCreateScreenState extends State<ActivityCreateScreen> {
  Position _currentPosition;

  void _saveActivity(BuildContext context) {
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
