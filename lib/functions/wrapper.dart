import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:metro_assist/Models/stations_model.dart';
import 'package:metro_assist/functions/nearest_station.dart';

MetroStation findNearestStationFromLatLng(LatLng point, List<MetroStation> stations) {
  final fakePosition = Position(
    latitude: point.latitude,
    longitude: point.longitude,
    timestamp: DateTime.now(),
    accuracy: 0.0,
    altitude: 0.0,
    heading: 0.0,
    speed: 0.0,
    speedAccuracy: 0.0,
    floor: 0,
    headingAccuracy: 0.0,
    altitudeAccuracy: 0.0,
  );

  return findNearestStation(fakePosition, stations);
}
