import 'package:advanced_weather/data/user%20location%20data/userloc.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/user_location.dart';

part 'user_loc_event.dart';
part 'user_loc_state.dart';

class UserLocBloc extends Bloc<UserLocEvent, UserLocState> {
  final CurrentLocation _location;
  UserLocBloc(this._location) : super(UserLocInitial()) {
    on<UserLocEvent>((event, emit) async {
      try {
        UserLocation userData = await _location.getCurrentLocation();
        emit(UserlocLoaded(userLocation: userData));
      } catch (e) {
        emit(UserLocError(error: e.toString()));
      }
    });
  }
}
