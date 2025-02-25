import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class MapHelper {
  static const String mabBoxAccessToken =
      "pk.eyJ1IjoibWlkbzQzMSIsImEiOiJjbHhpbnF2YjAxaGdrMnJxdG0xOGlvemFlIn0.odIUtDPxf0UNaRkJIsEkTA";
  static const String urlTemplate =
      "https://api.mapbox.com/styles/v1/mido431/clxiom26d00a601qn3clwavn6/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoibWlkbzQzMSIsImEiOiJjbHhpbnF2YjAxaGdrMnJxdG0xOGlvemFlIn0.odIUtDPxf0UNaRkJIsEkTA";
  static const String mabBoxStyleDarkId = "";
  static const String mabBoxStyleOutDoorId =
      "mapbox://styles/mapbox/outdoors-v12";
  static const String mabBoxStyleStreetId = "";
  static const String mabBoxStyleNightId = "";

  static const String myLocation = "";

  // static Future<void> getCurrentLocation() async {
  //   Position position = await _determinePosition();
  //   print('getCurrentLocation');
  //   print(position);
  // }

  // static Future<Position> _determinePosition() async {
  //   LocationPermission permission;
  //
  //   permission = await Geolocator.checkPermission();
  //
  //   if (permission == LocationPermission.denied) {
  //     permission = await Geolocator.requestPermission();
  //     if (permission == LocationPermission.denied) {
  //       print('LocationPermission.denied');
  //     }
  //   }
  //
  //   return await Geolocator.getCurrentPosition();
  // }


  static Future<List<String>> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    final currentLocation = await Geolocator.getCurrentPosition();
    // final currentAddress = await GeoCode().reverseGeocoding(
    //     latitude: currentLocation.latitude,
    //     longitude: currentLocation.longitude);
    // return currentAddress;
    // From coordinates
    List<Placemark> placemarks = await placemarkFromCoordinates(currentLocation.latitude, currentLocation.longitude);
    String address = "${placemarks[0].subAdministrativeArea} ${placemarks[0].administrativeArea} ${placemarks[0].country}";
    return [address,currentLocation.latitude.toString(),currentLocation.longitude.toString()];
  }
}