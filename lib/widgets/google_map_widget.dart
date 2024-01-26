import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_flutter_platform_interface/google_maps_flutter_platform_interface.dart';

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
  Marker? punchInMarker;
  Marker? punchOutMarker;
  Marker? currentLocationMarker;

  _addCurrentLocationMarker(CurrentLocation currentLoc) {
    setState(() {
      LatLng pos = LatLng(currentLoc.lat, currentLoc.long);
      currentLocationMarker = null;
      currentLocationMarker = Marker(
        markerId: const MarkerId('currentLoc'),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
        position: pos,
      );
    });
  }

  _addPunchMarker(LatLng pos) {
    if (punchInMarker == null ||
        (punchInMarker != null && punchOutMarker != null)) {
      // Checks if punchIn marker is not set, or
      // if both punchIn & punchOut markers are already set.
      setState(() {
        punchInMarker = Marker(
          markerId: const MarkerId('punchIn'),
          infoWindow: const InfoWindow(
            title: 'Punch In',
            snippet: '17 Jan 2024 (06:28 AM)',
          ),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
          position: pos,
        );
        punchOutMarker = null;
      });
    } else {
      // PunchIn is already set
      setState(() {
        punchOutMarker = Marker(
          markerId: const MarkerId('punchOut'),
          infoWindow: const InfoWindow(
            title: 'Punch Out',
            snippet: '17 Jan 2024 (07:28 PM)',
          ),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
          position: pos,
        );
      });
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
        if (punchInMarker != null) punchInMarker!,
        if (punchOutMarker != null) punchOutMarker!,
        if (currentLocationMarker != null) currentLocationMarker!,
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
