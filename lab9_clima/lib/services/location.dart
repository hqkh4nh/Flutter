import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';

class Location {
  // default to Da Nang when GPS is not available
  double latitude = 16.0544;
  double longitude = 108.2022;
  bool isDefault = true;

  Future<void> getCurrentLocation() async {
    try {
      final serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) return;

      var permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        return;
      }

      final position = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.low,
        ),
      );
      latitude = position.latitude;
      longitude = position.longitude;
      isDefault = false;
    } catch (e) {
      // keep the default coordinates on error
      debugPrint('$e');
    }
  }
}
