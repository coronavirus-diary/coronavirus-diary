import 'package:flutter/material.dart';

import 'package:coronavirus_diary/src/data/models/event.dart';

class LocationCard extends StatelessWidget {
  final LocationEvent locationEvent;

  const LocationCard([this.locationEvent]);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Text(
                'Location event',
                style: Theme.of(context).textTheme.title,
              ),
            ),
            Text('Latitude: ${locationEvent.latitude}'),
            Text('Longitude: ${locationEvent.longitude}'),
          ],
        ),
      ),
    );
  }
}
