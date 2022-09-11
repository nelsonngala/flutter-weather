import 'package:advanced_weather/data/geo%20location%20data/geo_location.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/geo_location.dart';

part 'geo_event.dart';
part 'geo_state.dart';

class GeoBloc extends Bloc<GeoblocEvent, GeoblocState> {
  final GeolocData _geolocData;
  GeoBloc(
    this._geolocData,
  ) : super(GeoblocInitial()) {
    on<GeoblocEvent>((event, emit) async {
      try {
        if (event is GeoLoadingEvent) {
          List<GeoLocModel>? locData =
              await _geolocData.getLocation(event.location);
          if (locData == null) {
            emit(const GeoError(
              error: 'No location with that name in our database',
            ));
          }
          if (locData!.isEmpty) {
            emit(
              const GeoError(error: 'The location entered is not available'),
            );
          } else {
            emit(GeoLoaded(geoLocation: locData));
          }
        }
      } catch (e) {
        emit(const GeoError(error: 'Something went wrong, try again later'));
      }
    });
  }
}
