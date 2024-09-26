// ignore_for_file: camel_case_types

part of 'home_bloc.dart';

sealed class HomeState {}

final class HomeInitial extends HomeState {}

//banner
final class HomeBannerLoadingState extends HomeState {}

final class HomeBannerLoadedState extends HomeState {}

final class HomeBannerErrorState extends HomeState {}

//best seller
final class BestSellerHomeLoadingState extends HomeState {}

final class BestSellerHomeLoadedState extends HomeState {}

final class BestSellerHomeErrorState extends HomeState {}

//wishlist

final class WishlistLoadingState extends HomeState {}

final class WishlistLoadedState extends HomeState {}

final class WishlistErrorState extends HomeState {}

final class RemoveWishlistLoadingState extends HomeState {}

final class RemoveWishlistLoadedState extends HomeState {}

final class RemoveWishlistErrorState extends HomeState {}

final class Add_to_WishlistLoadingState extends HomeState {}

final class Add_to_WishlistLoadedState extends HomeState {}

final class Add_to_WishlistErrorState extends HomeState {}

//cart

final class CartLoadingState extends HomeState {}
final class CartLoadedState extends HomeState {}

final class RemoveCartLoadingState extends HomeState {}
final class RemoveCartLoadedState extends HomeState {}

final class Add_to_CartLoadingState extends HomeState {}
final class Add_to_CartLoadedState extends HomeState {}

