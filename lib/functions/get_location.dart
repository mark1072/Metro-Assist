// ignore_for_file: deprecated_member_use

import 'package:geolocator/geolocator.dart';

Future<Position> getUserLocation() async {
  return await Geolocator.getCurrentPosition(
    desiredAccuracy: LocationAccuracy.high,
  );
}
