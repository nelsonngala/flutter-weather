part of 'geo_bloc.dart';

abstract class GeoblocEvent extends Equatable {
  const GeoblocEvent();
}

class GeoLoadingEvent extends GeoblocEvent {
  final String location;
  const GeoLoadingEvent({
    required this.location,
  });
  @override
  List<Object?> get props => [location];
}

// class GeoLoadedEvent extends GeoblocEvent {
//   final GeoLocModel geoLocation;
//   const GeoLoadedEvent({required this.geoLocation});
//   @override
//   List<Object?> get props => [geoLocation];
// }
