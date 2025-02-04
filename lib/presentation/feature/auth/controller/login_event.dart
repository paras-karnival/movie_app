part of 'login_bloc.dart';

sealed class LoginEvent extends Equatable {
  const LoginEvent();
}

class LoginRequestEvent extends LoginEvent {
  const LoginRequestEvent();
  @override
  List<Object?> get props => [];
}
