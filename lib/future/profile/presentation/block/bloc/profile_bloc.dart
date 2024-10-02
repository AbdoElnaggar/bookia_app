// ignore_for_file: unused_local_variable, unused_catch_clause

import 'dart:developer';
import 'package:bookia_app/future/profile/date/model/response/profile_response_model/profile_response_model.dart';
import 'package:bookia_app/future/profile/date/model/response/profile_response_model/update_password/update_password_response_model/update_password_response_model.dart';
import 'package:bookia_app/future/profile/date/repo/Profile_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial()) {
    on<GetProfileEvent>(getProfile);
    on<GetUpdatePasswordEvent>(getPasswordUpdate);
  }

  ProfileResponseModel? profileResponseModel;
  UpdatePasswordResponseModel?updatePasswordResponseModel;

  Future<void> getProfile(
      GetProfileEvent event, Emitter<ProfileState> emit) async {
    emit(ProfileLoadingState());
    // try {
    await ProfileRepo.getProfileEvent().then((value) {
      if (value != null) {
        profileResponseModel = value;
        emit(ProfileSuccesState());
      } else {
        log('efremfdkmf');
        emit(ProfileErrorState());
      }
    });
    //} on Exception catch (e) {
    //log('error');
    //emit(ProfileErrorState());
    //}
  }

  Future<void> getPasswordUpdate(
      GetUpdatePasswordEvent event, Emitter<ProfileState> emit) async {
    emit(ProfileLoadingState());
    // try {
    await ProfileRepo.getUpdatePasswordEvent(currentpass:event.current_password,newpass: event.new_password,confirmPass: event.new_password_confirmation).then((value) {
      if (value != null) {
        updatePasswordResponseModel = value;
        emit(UpdatePasswordSuccesState());
      } else {
        log('efremfdkmf');
        emit(UpdatePasswordErrorState());
      }
    });
  }
}
