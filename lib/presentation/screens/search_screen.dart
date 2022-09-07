import 'package:advanced_weather/logic/weatherbloc/weather_bloc.dart';
import 'package:advanced_weather/presentation/widgets/geoWidgets/error_geo.dart';
import 'package:advanced_weather/presentation/widgets/geoWidgets/loaded_geo.dart';
import 'package:advanced_weather/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/geobloc/geo_bloc.dart';
import '../widgets/app_utilities.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController cityController = TextEditingController();
  @override
  void dispose() {
    cityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<WeatherBloc, WeatherState>(
      listener: (context, state) {
        if (state is WeatherLoading) {
          Navigator.of(context).pop();
        }
      },
      child: Theme(
        data: Theme.of(context).copyWith(primaryColor: const Color(0xffFafafb)),
        child: Scaffold(
          appBar: AppBar(
            title: Text('Location', style: style()),
            backgroundColor: Theme.of(context).primaryColor,
            foregroundColor: AppUtilities.textColor,
            centerTitle: true,
          ),
          body: Column(
            children: [
              const SizedBox(height: 10),
              TextField(
                onChanged: (value) {
                  if (value.trim().isNotEmpty) {
                    return BlocProvider.of<GeoBloc>(context)
                        .add(GeoLoadingEvent(location: value));
                  }
                  return;
                },
                textInputAction: TextInputAction.search,
                controller: cityController,
                decoration: const InputDecoration(
                  hintText: 'city or town name e.g London',
                ),
                onEditingComplete: () {
                  BlocProvider.of<GeoBloc>(context)
                      .add(GeoLoadingEvent(location: cityController.text));
                },
              ),
              Expanded(
                child: BlocBuilder<GeoBloc, GeoblocState>(
                    builder: ((context, state) {
                  if (state is GeoLoaded) {
                    return LoadedGeo(geolocModel: state.geoLocation);
                  }
                  if (state is GeoError) {
                    return ErrorGeo(error: state.error);
                  }
                  return Container();
                })),
              )
            ],
          ),
        ),
      ),
    );
  }
}
