import 'package:geolocator/geolocator.dart';
import 'package:metro_assist/Models/stations_model.dart';

MetroStation findNearestStation(
    Position userPosition, List<MetroStation> stations) {
      
  double minDistance = double.infinity;
  late MetroStation nearest;

  for (var station in stations) {
    final distance = Geolocator.distanceBetween(
      userPosition.latitude,
      userPosition.longitude,
      station.lat,
      station.lng,
    );

    if (distance < minDistance) {
      minDistance = distance;
      nearest = station;
    }
  }

  return nearest;
}
