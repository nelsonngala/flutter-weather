import 'package:advanced_weather/data/models/geo_location.dart';
import 'package:http/http.dart';

class GeolocData {
  Future<List<GeoLocModel>>? getLocation(String location) async {
    Response response = await get(Uri.parse(
        'http://api.openweathermap.org/geo/1.0/direct?q=$location&limit=5&appid=2ab5e75aa87b094321d874fb7bffb261'));
    List<GeoLocModel> geoData = geoLocationFromJson(response.body);
    return geoData;
  }
}
