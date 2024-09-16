// ignore_for_file: avoid_types_as_parameter_names, file_names


import 'dart:developer';

import 'package:bookia_app/future/auth/data/repo/auth_repo.dart';
import 'package:bookia_app/future/auth/presentation/blok/authEvent.dart';
import 'package:bookia_app/future/auth/presentation/blok/authState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBlok extends Bloc<AuthEvent, AuthState> {
  AuthBlok() : super(IntialState()) {
    on<AuthRegstergEvent>(register);
  }

  Future<void> register(
      AuthRegstergEvent event, Emitter<AuthState> emit) async {
    emit(RegisterLoadingState());
try{
    await Auth_repo.register(event.prams).then((value) {
     
      if (value != null) {
        emit(RegisterSuccesState());
      } else {
        emit(RegisterErrorState(error: "SomeThing Occerd"));
      }
      
    });
      }
    on Exception catch (e) {
      log(e.toString());
      emit(RegisterErrorState(error: "Something went wrong"));
    }     
  }



  Future<void> login(
      AuthRegstergEvent event, Emitter<AuthState> emit) async {
    emit(RegisterLoadingState());
try{
    await Auth_repo.register(event.prams).then((value) {
     
      if (value != null) {
        emit(RegisterSuccesState());
      } else {
        emit(RegisterErrorState(error: "SomeThing Occerd"));
      }
      
    });
      }
    on Exception catch (e) {
      log(e.toString());
      emit(RegisterErrorState(error: "Something went wrong"));
    }     
  }
}
