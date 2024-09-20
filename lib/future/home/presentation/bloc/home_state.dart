part of 'home_bloc.dart';

sealed class HomeState {}

final class HomeInitial extends HomeState {}
//best seller
final class BestSellerHomeLoadingState extends HomeState {}

final class BestSellerHomeLoadedState extends HomeState {}

final class BestSellerHomeErrorState extends HomeState {}
