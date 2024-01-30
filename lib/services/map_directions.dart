import 'package:employee_attendance/models/directions.dart';

import 'env.dart';
import 'network.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

final apiNet =
    APINetwork('https://maps.googleapis.com/maps/api/directions/json?');

class MapDirections {
  final LatLng origin;
  final LatLng destination;

  MapDirections({
    required this.origin,
    required this.destination,
  });

  getDirections() async{
    Map<String, dynamic> data = await apiNet.getData(
      queryParameters: {
        'origin': '${origin.latitude}, ${origin.longitude}',
        'destination': '${destination.latitude}, ${destination.longitude}',
        'key': googleAPIKey,
      }
    );
    print ('Map Direcctions: \n$data');
    print ('Map Direcctions: \n$data');
    return Directions.fromMap(data);
  }
}

