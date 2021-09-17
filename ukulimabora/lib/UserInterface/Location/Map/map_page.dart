import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  LatLng cameraPosition = const LatLng(-1.2921, 36.8219);
  final Set<Marker> _markers = <Marker>{};

  void _onMapCreated(GoogleMapController googleMapController) {
    setState(() {
      _markers.add(const Marker(
          markerId: MarkerId('farm_id'),
          position: LatLng(36.8219, -1.2921),
          infoWindow: InfoWindow(title: 'My Farm')));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Map'),
        ),
        body: GoogleMap(
            onMapCreated: _onMapCreated,
            markers: _markers,
            initialCameraPosition:
                CameraPosition(target: cameraPosition, zoom: 20, tilt: 0.5)));
  }
}
