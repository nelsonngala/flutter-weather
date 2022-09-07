// To parse this JSON data, do
//
//     final geoLocation = geoLocationFromJson(jsonString);

import 'dart:convert';

List<GeoLocModel> geoLocationFromJson(String str) => List<GeoLocModel>.from(
    json.decode(str).map((x) => GeoLocModel.fromJson(x)));

String geoLocationToJson(List<GeoLocModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GeoLocModel {
  GeoLocModel({
    required this.name,
    required this.lat,
    required this.lon,
    required this.country,
    required this.state,
  });

  final String name;

  final double lat;
  final double lon;
  final String country;
  final String? state;

  factory GeoLocModel.fromJson(Map<String, dynamic> json) => GeoLocModel(
        name: json["name"],
        lat: json["lat"].toDouble(),
        lon: json["lon"].toDouble(),
        country: json["country"],
        state: json["state"] ?? '_',
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "lat": lat,
        "lon": lon,
        "country": country,
        "state": state ?? '_',
      };
}
