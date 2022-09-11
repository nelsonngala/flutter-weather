import 'package:advanced_weather/data/models/user_location.dart';
import 'package:geolocator/geolocator.dart';

class CurrentLocation {
  Future<UserLocation> getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    UserLocation userLocation =
        UserLocation(lat: position.latitude, lon: position.longitude);

    return userLocation;
  }
}
