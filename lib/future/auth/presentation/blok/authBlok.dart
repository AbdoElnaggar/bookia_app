// ignore_for_file: avoid_types_as_parameter_names, file_names

import 'dart:developer';

import 'package:bookia_app/core/services/local_storage.dart';
import 'package:bookia_app/future/auth/data/repo/auth_repo.dart';
import 'package:bookia_app/future/auth/presentation/blok/authEvent.dart';
import 'package:bookia_app/future/auth/presentation/blok/authState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBlok extends Bloc<AuthEvent, AuthState> {
  AuthBlok() : super(IntialState()) {
    on<AuthRegstergEvent>(register);

    on<LoginEvent>(login);
  }

  Future<void> register(
      AuthRegstergEvent event, Emitter<AuthState> emit) async {
    emit(RegisterLoadingState());
    try {
      await Auth_repo.register(event.prams).then((value) {
        if (value != null) {
          ApplocalStorage.Cachdata(
              key: ApplocalStorage.token, value: value.data?.token);
          emit(RegisterSuccesState());
        } else {
          emit(RegisterErrorState(error: "SomeThing Occerd"));
        }
      });
    } on Exception catch (e) {
      log(e.toString());
      emit(RegisterErrorState(error: "Something went wrong"));
    }
  }

  Future<void> login(LoginEvent event, Emitter<AuthState> emit) async {
    emit(LoginLoadingState());
    try {
      await Auth_repo.Login(
        email: event.email,
        password: event.password,
      ).then((value) {
        log(value.toString());
        if (value != null) {
          ApplocalStorage.Cachdata(
              key: ApplocalStorage.token, value: value.data?.token);
          emit(LoginSuccesState());
        } else {
          // log("--------------------------email is ${event.email} and password is ${event.password} ");
          emit(LoginErrorState(error: "SomeThing Occerd"));
        }
      });
    } on Exception catch (e) {
      log(e.toString());
      emit(LoginErrorState(error: "Something went wrong"));
    }
  }
}
