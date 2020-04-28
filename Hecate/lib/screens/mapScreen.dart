import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:Hecate/utils/waypoints.dart' as wayPoints;

class MapScreen extends StatefulWidget {
  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController mapController;
  static Position _currentPosition;

  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;

  final Map<String, Marker> _markers = {};


  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(0, 0),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

      body: Stack(
        children: <Widget>[
          GoogleMap(
            mapType: MapType.hybrid,
            onMapCreated: (GoogleMapController controller) {
              mapController = controller;
            },
            initialCameraPosition: _kLake,
            markers: _markers.values.toSet(),
          ),
          Container(
            padding: const EdgeInsets.all(4.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: FloatingActionButton(
                      onPressed: () => { },
                      child: Icon(Icons.airplanemode_active),
                      elevation: 10.0,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: FloatingActionButton(
                      onPressed: () => _getCurrentLocation(),
                      child: Icon(Icons.radio),
                      elevation: 10.0,
                    ),
                  ),
                ],
              ),
            )
          )
        ],
      ),
    );
  }
  @override
  void initState(){
    Timer timer = new Timer(new Duration(seconds: 5), () {
      _getWayPoints(mapController);
    });
    _getCurrentLocation();
    super.initState();
  }
  _getCurrentLocation() {
    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      mapController.animateCamera(CameraUpdate.newCameraPosition(
          CameraPosition(
              target: LatLng(position.latitude, position.longitude),
              zoom: 18
          )
      ));
    }).catchError((e) {
      print(e);
    });
  }

    Future<void> _getWayPoints(GoogleMapController controller) async {
      final WayPoints = await wayPoints.getWayPoints();
      setState(() {
        _markers.clear();
        for (final waypoint in WayPoints.waypoints) {
          final marker = Marker(
            markerId: MarkerId(waypoint.id),
            position: LatLng(waypoint.lat, waypoint.lng),
            draggable: true,
            infoWindow: InfoWindow(
              title: waypoint.id,
              // snippet: waypoint.address,
            ),
          );
          _markers[waypoint.id] = marker;
        }
      });
    }


}
