// ignore_for_file: file_names

import '../../data/models/request/registerPrams.dart';

class AuthEvent {}

class AuthRegstergEvent extends AuthEvent {
  final RedisterPrams prams;
  AuthRegstergEvent(this.prams);
}

//login
class LoginEvent extends AuthEvent {
  final String email;
  final String password;

  LoginEvent({required this.email, required this.password});
}