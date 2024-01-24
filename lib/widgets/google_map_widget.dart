import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_flutter_platform_interface/google_maps_flutter_platform_interface.dart';

class GoogleMapWidget extends StatefulWidget {
  final bool compassEnabled;
  final bool zoomControlsEnabled;
  final bool myLocationButtonEnabled;

  const GoogleMapWidget({
    this.compassEnabled = false,
    this.zoomControlsEnabled = false,
    this.myLocationButtonEnabled = false,
    super.key});

  @override
  State<GoogleMapWidget> createState() => _GoogleMapWidgetState();
}

class _GoogleMapWidgetState extends State<GoogleMapWidget> {
  final Completer<GoogleMapController> mapController =
  Completer<GoogleMapController>();

  // @override
  // bool get wantKeepAlive => true;

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(4.8472226, 6.974604),
    zoom: 14.4746,
  );
  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      mapType: MapType.normal,
      myLocationEnabled: true,
      zoomControlsEnabled: widget.zoomControlsEnabled,
      myLocationButtonEnabled: widget.myLocationButtonEnabled,
      compassEnabled: widget.compassEnabled,
      initialCameraPosition: _kGooglePlex,
      markers: const {
      },
      onTap: (latLngr){},
      onMapCreated: (GoogleMapController controller) {
        mapController.complete(controller);
      },
    );
  }
}
