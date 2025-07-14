import 'package:geolocator/geolocator.dart';

import '../../../index.dart';

class LocationUtils {
  static Future<Position> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    /// Check if location services are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw LocationException(message: kLocationServiceDisabled);
    }

    /// Check permission status
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw LocationException(message: kLocationPermissionDenied);
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw LocationException(message: kLocationPermissionPermanentlyDenied);
    }

    /// Get the current position
    return await Geolocator.getCurrentPosition(
      locationSettings: LocationSettings(
        accuracy: LocationAccuracy.high,
        // You can add other settings here if needed
      ),
    );
  }
}
