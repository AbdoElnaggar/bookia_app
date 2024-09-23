part of 'home_bloc.dart';

sealed class HomeEvent {}

class GetBestSallerEvent extends HomeEvent {}

class GetHomeBannerEvent extends HomeEvent {}

class GetWishlistEvent extends HomeEvent {}
