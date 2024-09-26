// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

part of 'home_bloc.dart';

sealed class HomeEvent {}

class GetBestSallerEvent extends HomeEvent {}

class GetHomeBannerEvent extends HomeEvent {}

//wishlist
class GetWishlistEvent extends HomeEvent {}

class RemoveWishlistEvent extends HomeEvent {
  final product_id;
  RemoveWishlistEvent({required this.product_id});
}

class Add_To_WishlistEvent extends HomeEvent {
  final product_id;
  Add_To_WishlistEvent({required this.product_id});
}

//cart

class GetCartEvent extends HomeEvent {}

class RemoveCartEvent extends HomeEvent {
  final product_id;
  RemoveCartEvent({required this.product_id});
}

class Add_To_CartEvent extends HomeEvent {
  final product_id;
  Add_To_CartEvent({required this.product_id});
}
