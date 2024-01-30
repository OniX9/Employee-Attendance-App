import 'package:employee_attendance/constants.dart';
import 'package:employee_attendance/models/directions.dart';
import 'package:employee_attendance/services/map_directions.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapWidget extends StatefulWidget {
  final bool compassEnabled;
  final bool zoomControlsEnabled;
  CurrentLocation currentLocation;
  final bool myLocationButtonEnabled;
  final bool currentLocationMarkerOnly;

  GoogleMapWidget(
      {required this.currentLocation,
      this.compassEnabled = false,
      this.zoomControlsEnabled = false,
      this.myLocationButtonEnabled = false,
      this.currentLocationMarkerOnly = false,
      super.key});

  @override
  State<GoogleMapWidget> createState() => _GoogleMapWidgetState();
}

class _GoogleMapWidgetState extends State<GoogleMapWidget> {
  late GoogleMapController mapController;
  Marker? _punchInMarker;
  Marker? _punchOutMarker;
  Marker? _currentLocationMarker;
  Directions? _dirInfo;

  _addCurrentLocationMarker(CurrentLocation currentLoc) async {
    setState(() {
      LatLng pos = LatLng(currentLoc.lat, currentLoc.long);
      _currentLocationMarker = null;
      _currentLocationMarker = Marker(
        markerId: const MarkerId('currentLoc'),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
        position: pos,
      );
    });
  }

  _addPunchMarker(LatLng pos) async {
    if (_punchInMarker == null ||
        (_punchInMarker != null && _punchOutMarker != null)) {
      // Checks if punchIn marker is not set, or
      // if both punchIn & punchOut markers are already set.
      setState(() {
        _punchInMarker = Marker(
          markerId: const MarkerId('punchIn'),
          infoWindow: const InfoWindow(
            title: 'Punch In',
            snippet: '17 Jan 2024 (06:28 AM)',
          ),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
          position: pos,
        );
        _punchOutMarker = null;
        _dirInfo = null;
      });
    } else {
      // PunchIn is already set
      setState(() {
        _punchOutMarker = Marker(
          markerId: const MarkerId('punchOut'),
          infoWindow: const InfoWindow(
            title: 'Punch Out',
            snippet: '17 Jan 2024 (07:28 PM)',
          ),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
          position: pos,
        );
      });
      final directions = await MapDirections(
        origin: pos,
        destination: _punchInMarker!.position,
      ).getDirections();
      setState(() => _dirInfo = directions);
      CameraUpdate.newLatLngBounds(_dirInfo!.bounds, 100.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    CameraPosition MyLocation = CameraPosition(
      target: LatLng(widget.currentLocation.lat, widget.currentLocation.long),
      zoom: 14.4746,
    );
    widget.currentLocationMarkerOnly
        ? _addCurrentLocationMarker(widget.currentLocation)
        : null;
    return GoogleMap(
      mapType: MapType.normal,
      myLocationEnabled: true,
      zoomControlsEnabled: widget.zoomControlsEnabled,
      myLocationButtonEnabled: widget.myLocationButtonEnabled,
      compassEnabled: widget.compassEnabled,
      initialCameraPosition: MyLocation,
      markers: {
        if (_punchInMarker != null) _punchInMarker!,
        if (_punchOutMarker != null) _punchOutMarker!,
        if (_currentLocationMarker != null) _currentLocationMarker!,
      },
      polylines: {
        if (_dirInfo != null)
          Polyline(
              polylineId: PolylineId('overview_polyline'),
            color: kPrimaryColorLight,
            points: _dirInfo!.polylinePoints
                .map((e) => LatLng(e.latitude, e.longitude))
                .toList(),
          ),
      },
      onTap: widget.currentLocationMarkerOnly ? null : _addPunchMarker,
      onMapCreated: (GoogleMapController controller) {
        mapController = controller;
      },
    );
  }
}

class CurrentLocation {
  double lat;
  double long;
  CurrentLocation({required this.lat, required this.long});
}
