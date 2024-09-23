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