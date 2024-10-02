part of 'profile_bloc.dart';

class ProfileEvent {}

class GetProfileEvent extends ProfileEvent {}

class GetUpdatePasswordEvent extends ProfileEvent {
  final String  current_password;
  final String new_password;
  final String new_password_confirmation;
  GetUpdatePasswordEvent({required this.current_password,required this.new_password,required this.new_password_confirmation});
}
