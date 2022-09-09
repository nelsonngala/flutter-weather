part of 'user_loc_bloc.dart';

abstract class UserLocState extends Equatable {}

class UserLocInitial extends UserLocState {
  @override
  List<Object?> get props => [];
}

class UserlocLoaded extends UserLocState {
  final UserLocation userLocation;
  UserlocLoaded({
    required this.userLocation,
  });
  @override
  List<Object?> get props => [];
}

class UserLocError extends UserLocState {
  final String error;
  UserLocError({
    required this.error,
  });
  @override
  List<Object?> get props => [];
}
