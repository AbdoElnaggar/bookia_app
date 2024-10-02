part of 'profile_bloc.dart';

sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class ProfileSuccesState extends ProfileState {}

final class ProfileLoadingState extends ProfileState {}

final class ProfileErrorState extends ProfileState {}

final class UpdatePasswordSuccesState extends ProfileState {}

final class UpdatePasswordLoadingState extends ProfileState {}

final class UpdatePasswordErrorState extends ProfileState {}
