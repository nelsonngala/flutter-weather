import 'package:advanced_weather/data/models/weather_model.dart';
import 'package:http/http.dart';

class WeatherData {
  Future<WeatherModel?> getWeather(double lat, double lon) async {
    Response response = await get(Uri.parse(
      'http://api.openweathermap.org/data/2.5/forecast?lat=$lat&lon=$lon&appid=2ab5e75aa87b094321d874fb7bffb261&units=metric',
    ));
    WeatherModel apiData = weatherModelFromJson(response.body);

    return apiData;
  }
}
