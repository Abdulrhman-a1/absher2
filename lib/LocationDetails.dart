import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationDetails {
  final String address;
  final String time;
  final String distance;
  final LatLng position;

  LocationDetails({
    required this.address,
    required this.time,
    required this.distance,
    required this.position,
  });
}
