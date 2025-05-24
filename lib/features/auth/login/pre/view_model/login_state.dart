import 'package:equatable/equatable.dart';
import 'package:real_state/features/auth/register/data/model/register_response.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object?> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final RegisterResponse data;

  const LoginSuccess(this.data);

  @override
  List<Object?> get props => [data];
}

class LoginFailure extends LoginState {
  final String message;

  const LoginFailure(this.message);

  @override
  List<Object?> get props => [message];
}
