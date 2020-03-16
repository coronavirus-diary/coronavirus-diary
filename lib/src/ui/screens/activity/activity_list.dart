import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

import 'package:coronavirus_diary/src/data/database/database.dart';

class ActivityList extends StatefulWidget {
  final List<ActivityWithLocation> activities;

  const ActivityList({this.activities = const []});

  @override
  _ActivityListState createState() => _ActivityListState();
}

class _ActivityListState extends State<ActivityList> {
  MapController mapController;
  List<LatLng> points = [];

  @override
  void initState() {
    super.initState();
    points = _getPoints();
    mapController = MapController();
    mapController.onReady.then((result) {
      mapController.fitBounds(LatLngBounds.fromPoints(points));
    });
  }

  List<LatLng> _getPoints() {
    return widget.activities.map((ActivityWithLocation activity) {
      return LatLng(activity.location.lat, activity.location.long);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      mapController: mapController,
      options: MapOptions(),
      layers: [
        TileLayerOptions(
          urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
          subdomains: ['a', 'b', 'c'],
        ),
        PolylineLayerOptions(
          polylines: [
            Polyline(
              points: points,
              strokeWidth: 4.0,
              color: Colors.purple,
            ),
          ],
        ),
      ],
    );
  }
}
