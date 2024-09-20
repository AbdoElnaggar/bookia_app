// ignore_for_file: unused_import, unused_catch_clause

import 'dart:developer';

import 'package:bookia_app/future/home/date/home_repo/home_repo.dart';
import 'package:bookia_app/future/home/date/model/response/best_seller_response_model/best_seller_response_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<GetBestSallerEvent>(getBestSallerBooks);
  }

  BestSellerResponseModel? bestSellerResponseModel;

  Future<void> getBestSallerBooks(GetBestSallerEvent event, Emitter<HomeState> emit) async {
    emit(BestSellerHomeLoadingState());
    try {
      await HomeRepo.getBestSellerBooks().then((value) {
        if (value != null) {
          bestSellerResponseModel = value;
          emit(BestSellerHomeLoadedState());
        } else {
          emit(BestSellerHomeErrorState());
        }
      });
    } on Exception catch (e) {
      // log(e.toString());
      log('error');
      emit(BestSellerHomeErrorState());
    }
  }
  }



