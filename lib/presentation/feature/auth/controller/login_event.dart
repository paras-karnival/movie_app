part of 'login_bloc.dart';

sealed class LoginEvent extends Equatable {
  const LoginEvent();
}

class LoginRequestEvent extends LoginEvent {
  final String email;
  final String password;
  const LoginRequestEvent({required this.email,required this.password});
  @override
  List<Object?> get props => [];
}
