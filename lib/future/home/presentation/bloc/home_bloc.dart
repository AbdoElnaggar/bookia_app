// ignore_for_file: unused_import, unused_catch_clause, duplicate_import

import 'dart:developer';

import 'package:bookia_app/future/home/date/home_repo/home_repo.dart';
import 'package:bookia_app/future/home/date/model/home_banner_response_model/home_banner_response_model.dart';
import 'package:bookia_app/future/home/date/model/response/best_seller_response_model/best_seller_response_model.dart';
import 'package:bookia_app/future/home/date/model/response/getWishList/get_wishlist_response_model/get_wishlist_response_model.dart';
import 'package:bookia_app/future/home/presentation/bloc/home_bloc.dart';
import 'package:bookia_app/future/home/presentation/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<GetBestSallerEvent>(getBestSallerBooks);
    on<GetHomeBannerEvent>(getHomeBanner);
    on<GetWishlistEvent>(getWishlist);
  }

  BestSellerResponseModel? bestSellerResponseModel;
  HomeBannerResponseModel? homeBannerResponseModel;
  GetWishlistResponseModel? getWishlistResponseModel;

//best seller
  Future<void> getBestSallerBooks(
      GetBestSallerEvent event, Emitter<HomeState> emit) async {
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

//Banner

  Future<void> getHomeBanner(
      GetHomeBannerEvent event, Emitter<HomeState> emit) async {
    emit(HomeBannerLoadingState());

    try {
      await HomeRepo.getHomeBanner().then((value) {
        if (value != null) {
          homeBannerResponseModel = value;
          emit(HomeBannerLoadedState());
        } else {
          emit(HomeBannerLoadingState());
        }
      });
    } on Exception catch (e) {
      log(e.toString());
      emit(WishlistErrorState());
    }
  }


//wishlist

  Future<void> getWishlist(
       GetWishlistEvent event, Emitter<HomeState> emit) async {
    emit(WishlistLoadingState());

    try {
      await HomeRepo.getHomeBanner().then((value) {
        if (value != null) {
          homeBannerResponseModel = value;
          emit(WishlistLoadedState());
        } else {
          emit(WishlistErrorState());
        }
      });
    } on Exception catch (e) {
      log(e.toString());
      emit(WishlistErrorState());
    }
  }


}
