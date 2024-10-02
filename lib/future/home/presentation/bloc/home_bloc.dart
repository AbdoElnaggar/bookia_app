// ignore_for_file: unused_import, unused_catch_clause, duplicate_import, unrelated_type_equality_checks

import 'dart:developer';

import 'package:bookia_app/future/home/date/home_repo/home_repo.dart';
import 'package:bookia_app/future/home/date/model/home_banner_response_model/home_banner_response_model.dart';
import 'package:bookia_app/future/home/date/model/response/best_seller_response_model/best_seller_response_model.dart';
import 'package:bookia_app/future/home/date/model/response/best_seller_response_model/product.dart';
import 'package:bookia_app/future/home/date/model/response/getWishList/get_wishlist_response_model/get_wishlist_response_model.dart';
import 'package:bookia_app/future/home/date/model/response/get_cart_response_model/get_cart_response_model.dart';
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
    //wislist
    on<GetWishlistEvent>(getWishlist);
    on<RemoveWishlistEvent>(removeWishlist);
    on<Add_To_WishlistEvent>(add_to_Wishlist);

    //cart
    on<GetCartEvent>(getCart);
    on<RemoveCartEvent>(removeCart);
    on<Add_To_CartEvent>(addToCart);
  }

  BestSellerResponseModel? bestSellerResponseModel;
  HomeBannerResponseModel? homeBannerResponseModel;
  GetWishlistResponseModel? getWishlistResponseModel;
  GetCartResponseModel? getCartResponseModel;

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
      await HomeRepo.getWishlist().then((value) {
        if (value != null) {
          getWishlistResponseModel = value;
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

  Future<void> add_to_Wishlist(
      Add_To_WishlistEvent event, Emitter<HomeState> emit) async {
    emit(Add_to_WishlistLoadingState());

    try {
      await HomeRepo.AddToWishlist(product_id: event.product_id).then((value) {
        if (value != null) {
          emit(Add_to_WishlistLoadedState());
        } else {
          emit(WishlistErrorState());
        }
      });
    } on Exception catch (e) {
      log(e.toString());
      emit(WishlistErrorState());
    }
  }

  Future<void> removeWishlist(
      RemoveWishlistEvent event, Emitter<HomeState> emit) async {
    emit(RemoveWishlistLoadingState());

    try {
      await HomeRepo.removeWishlist(product_id: event.product_id).then((value) {
        if (value != null) {
          emit(RemoveWishlistLoadedState());
        } else {
          emit(WishlistErrorState());
        }
      });
    } on Exception catch (e) {
      log(e.toString());
      emit(WishlistErrorState());
    }
  }

  //cart

  Future<void> getCart(GetCartEvent event, Emitter<HomeState> emit) async {
    emit(CartLoadingState());

    try {
      await HomeRepo.getCart().then((value) {
        if (value != null) {
          getCartResponseModel == value;
          emit(CartLoadedState());
        } else {
          emit(WishlistErrorState());
        }
      });
    } on Exception catch (e) {
      log(e.toString());
      emit(WishlistErrorState());
    }
  }

  Future<void> addToCart(
      Add_To_CartEvent event, Emitter<HomeState> emit) async {
    emit(Add_to_CartLoadingState());

    try {
      await HomeRepo.AddToCart(product_id: event.product_id).then((value) {
        if (value != null) {
          emit(Add_to_CartLoadedState());
        } else {
          emit(WishlistErrorState());
        }
      });
    } on Exception catch (e) {
      log(e.toString());
      emit(WishlistErrorState());
    }
  }

  Future<void> removeCart(
      RemoveCartEvent event, Emitter<HomeState> emit) async {
    emit(RemoveCartLoadingState());

    try {
      await HomeRepo.removeCart(product_id: event.product_id).then((value) {
        if (value != null) {
          emit(RemoveCartLoadedState());
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
