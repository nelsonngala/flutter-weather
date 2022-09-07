import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/geo_location.dart';
import '../../../logic/weatherbloc/weather_bloc.dart';

class LoadedGeo extends StatelessWidget {
  final List<GeoLocModel> geolocModel;
  const LoadedGeo({
    Key? key,
    required this.geolocModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: geolocModel.length,
        itemBuilder: ((context, index) {
          GeoLocModel locations = geolocModel[index];
          return ListTile(
            title: Text(
                '${locations.name}, ${locations.state ?? '_'},  ${locations.country}'),
            onTap: () {
              BlocProvider.of<WeatherBloc>(context).add(
                  WeatherLoadingEvent(lat: locations.lat, lon: locations.lon));
            },
          );
        }));
  }
}
