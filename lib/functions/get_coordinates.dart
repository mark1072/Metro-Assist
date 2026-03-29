import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

Future<LatLng> getCoordinatesFromPlace(String placeName) async {
  List<Location> locations = await locationFromAddress(placeName);
  if (locations.isEmpty) {
    throw 'Place not found';
  }
  final loc = locations.first;
  return LatLng(loc.latitude, loc.longitude);
}
