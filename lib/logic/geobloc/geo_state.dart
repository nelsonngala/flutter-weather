part of 'geo_bloc.dart';

abstract class GeoblocState extends Equatable {
  const GeoblocState();
}

class GeoblocInitial extends GeoblocState {
  @override
  List<Object?> get props => [];
}

class GeoLoaded extends GeoblocState {
  final List<GeoLocModel> geoLocation;
  const GeoLoaded({
    required this.geoLocation,
  });

  @override
  List<Object?> get props => [geoLocation];
}

class GeoError extends GeoblocState {
  final String error;
  const GeoError({
    required this.error,
  });

  @override
  List<Object?> get props => [error];
}
