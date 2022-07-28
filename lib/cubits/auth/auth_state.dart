part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

// login

class AuthLoginLoading extends AuthState {
  const AuthLoginLoading() : super();
}

class AuthLoginSuccess extends AuthState {
  const AuthLoginSuccess() : super();
}

class AuthLoginFailure extends AuthState {
  const AuthLoginFailure() : super();
}

// signup

class AuthSignUpLoading extends AuthState {}

class AuthSignUpSuccess extends AuthState {}

class AuthSignUpFailure extends AuthState {}

// logout

class AuthLogOut extends AuthState {
  const AuthLogOut();
}
