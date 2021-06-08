import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ndf_app/models/place.dart';

class MapScreen extends StatefulWidget {
  final PlaceLocation initialPosition;
  final bool isSelecting;

  MapScreen(
      {this.initialPosition = const PlaceLocation(
        latitude: 37.422,
        longitude: -122.084,
      ),
      this.isSelecting = false});

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  LatLng _pickedLocation;

  void _selectLocation(LatLng position) {
    setState(() {
      _pickedLocation = position;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Map'),
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(
            widget.initialPosition.latitude,
            widget.initialPosition.longitude,
          ),
          zoom: 16,
        ),
        onTap: widget.isSelecting ? _selectLocation  : null,
      ),
    );
  }
}
