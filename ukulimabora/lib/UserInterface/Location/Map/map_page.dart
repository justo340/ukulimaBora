import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:ukulimabora/Infrustracture/Services/Application_bloc.dart';
import 'package:ukulimabora/Shared/Common/constants.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  LatLng cameraPosition = const LatLng(-1.2921, 36.8219);
  final Set<Marker> _markers = <Marker>{};

  void _onMapCreated(GoogleMapController googleMapController) {
    setState(() {
      _markers.add(Marker(
          markerId: const MarkerId('farm_id'),
          position: cameraPosition,
          infoWindow: const InfoWindow(title: 'My Farm')));
    });
  }

  TextEditingController textController;
  String place;

  @override
  Widget build(BuildContext context) {
    final ApplicationBloc applicationBloc =
        Provider.of<ApplicationBloc>(context);

    final LatLng currentPosition = LatLng(
        applicationBloc.currentLocation.latitude,
        applicationBloc.currentLocation.longitude);

    return Scaffold(
        appBar: AppBar(
          iconTheme:
              IconThemeData(color: UkulimaBoraCommonColors.appBackgroudColor),
          backgroundColor: UkulimaBoraCommonColors.appGreenColor,
          centerTitle: true,
          title: Text(
            UkulimaBoraCommonText.mapText,
            style: TextStyle(color: UkulimaBoraCommonColors.appBackgroudColor),
          ),
        ),
        body: (applicationBloc.currentLocation != null)
            ? GoogleMap(
                myLocationEnabled: true,
                onMapCreated: _onMapCreated,
                markers: _markers,
                initialCameraPosition: CameraPosition(
                    target: currentPosition, zoom: 17, tilt: 0.2))
            : CircularProgressIndicator(
                backgroundColor: UkulimaBoraCommonColors.appGreenColor,
              ));
  }
}
