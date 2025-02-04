part of 'login_bloc.dart';

sealed class LoginState extends Equatable {
  const LoginState();
}

final class LoginInitial extends LoginState {
  @override
  List<Object> get props => [];
}

final class LoadingLoginState extends LoginState {
  const LoadingLoginState();
  @override
  List<Object> get props => [];
}

final class ErrorLoginState extends LoginState {
  final String error;
  const ErrorLoginState({required this.error});
  @override
  List<Object> get props => [error];
}

final class LoadedLoginState extends LoginState {
  final int statusCode;
  const LoadedLoginState({required this.statusCode});
  @override
  List<Object> get props => [statusCode];
}
