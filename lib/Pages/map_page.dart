import 'package:fl_code_qr/Models/scan_model.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  State<MapPage> createState() => _MapPageState();
}

LatLng getLatLng({resScan}) {
  final latLng = resScan.substring(4).split(',');
  final lat = double.parse(latLng[0]);
  final lng = double.parse(latLng[1]);
  return LatLng(lat, lng);
}

class _MapPageState extends State<MapPage> {
  MapType mapType = MapType.normal;
  Completer<GoogleMapController> _controller = Completer();
  @override
  Widget build(BuildContext context) {
    final scan = ModalRoute.of(context)?.settings.arguments;
    final CameraPosition _puntoInicial = CameraPosition(
        target: getLatLng(resScan: scan),
        zoom: 17.5,
        //tilt le da un hermoso angulo Z tridimecional
        tilt: 50,
        bearing: 30);
    double bearing = 0;

    //marcadores
    Set<Marker> market = new Set<Marker>();
    market.add(Marker(
        markerId: const MarkerId('Geo-Location'),
        position: getLatLng(resScan: scan)));

    return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.location_searching_rounded),
          onPressed: () async {
            if (bearing == 0) {
              bearing = 90;
            } else if (bearing == 90) {
              bearing = 180;
            } else if (bearing == 180) {
              bearing = 270;
            } else if (bearing == 270) {
              bearing = 0;
            } else if (bearing != 0) {
              bearing = 0;
            }

            final GoogleMapController controller = await _controller.future;
            controller.animateCamera(CameraUpdate.newCameraPosition(
                CameraPosition(
                    target: getLatLng(resScan: scan),
                    tilt: 50,
                    bearing: bearing,
                    zoom: 17.5)));
          },
        ),
        appBar: AppBar(title: const Text('Mapas'), centerTitle: true, actions: [
          IconButton(
              onPressed: () async {
                if (mapType == MapType.normal) {
                  mapType = MapType.satellite;
                } else {
                  mapType = MapType.normal;
                }
                setState(() {});
              },
              icon: const Icon(Icons.layers))
        ]),
        body: GoogleMap(
          zoomControlsEnabled: false,
          markers: market,
          mapType: mapType,
          initialCameraPosition: _puntoInicial,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
        ));
  }
}
