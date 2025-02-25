import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  final List<String> locations;

  const MapPage({Key? key, required this.locations}) : super(key: key);

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  late GoogleMapController mapController;
  final List<Marker> markers = [];
  bool isLoading = false;

  // @override
  // void initState() {
  //   super.initState();
  //   _loadLocations();
  // }
  //
  // Future<void> _loadLocations() async {
  //   for (String location in widget.locations) {
  //     try {
  //       List<Location> locations = await locationFromAddress(location);
  //       if (locations.isNotEmpty) {
  //         Location loc = locations.first;
  //         markers.add(
  //           Marker(
  //             markerId: MarkerId(location),
  //             position: LatLng(loc.latitude, loc.longitude),
  //             infoWindow: InfoWindow(title: location),
  //           ),
  //         );
  //       }
  //     } catch (e) {
  //       print('Error occurred while converting $location: $e');
  //     }
  //   }
  //   setState(() {
  //     isLoading = false;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Map Page'),
        backgroundColor: Colors.teal,
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : GoogleMap(
              onMapCreated: (GoogleMapController controller) {
                mapController = controller;
              },
              initialCameraPosition: const CameraPosition(
                target:
                     LatLng(0, 0),
                zoom: 10.0,
              ),
              markers: markers.toSet(),
            ),
    );
  }
}