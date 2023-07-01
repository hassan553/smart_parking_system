import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:spark/core/functions/globle_functions.dart';
import 'package:spark/features/home/views/home_view.dart';

class MapSample extends StatelessWidget {
  const MapSample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: const CameraPosition(
          target: LatLng(37.42796133580664, -122.085749655962),
          zoom: 14.4746,
        ),
        onMapCreated: (GoogleMapController controller) {},
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: ()=>navigateOff(const HomeView()),
        label: const Text('To the App'),
        icon: const Icon(Icons.navigate_next_outlined),
      ),
    );
  }
}
