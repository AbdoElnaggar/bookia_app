// ignore_for_file: file_names

class AuthState {}

class IntialState extends AuthState {}

class RegisterLoadingState extends AuthState {}

class RegisterSuccesState extends AuthState {}

class RegisterErrorState extends AuthState {
  final String error;
  RegisterErrorState({required this.error});
}

//login
class LoginState extends AuthState {}

class LoginSuccesState extends AuthState {}

class LoginLoadingState extends AuthState {}

class LoginErrorState extends AuthState {
  final String error;
  LoginErrorState({required this.error});
}
