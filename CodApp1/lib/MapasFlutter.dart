import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapasFlutter extends StatefulWidget {
  const MapasFlutter({super.key});

  @override
  State<MapasFlutter> createState() => _MapasFlutterState();
}

class _MapasFlutterState extends State<MapasFlutter> {
  Completer<GoogleMapController> _controller = Completer();
  Set<Marker> marcador = {};

  void carregar() {
    Set<Marker> marcadorCasa = {};

    Marker marcadorPontos = Marker(
        markerId: MarkerId("marcador-shopping"),
        position: LatLng(-29.1732358, -51.1905383),
        infoWindow: InfoWindow(title: "App Codeca"));

    marcadorCasa.add(marcadorPontos);

    marcador = marcadorCasa;

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    carregar();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mapas e Localização"),
      ),
      body: Container(
        child: GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition: CameraPosition(
              target: LatLng(-29.1732358, -51.1905383), zoom: 10),
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
          markers: marcador,
        ),
      ),
    );
  }
}