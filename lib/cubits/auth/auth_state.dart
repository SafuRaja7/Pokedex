// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  final User? user;
  final String? error;
  const AuthState({
    this.user,
    this.error,
  });

  @override
  List<Object> get props => [user!, error!];
}

class AuthInitial extends AuthState {}

// login
class AuthLoginLoading extends AuthState {
  const AuthLoginLoading() : super();
}

class AuthLoginSuccess extends AuthState {
  const AuthLoginSuccess({User? user}) : super(user: user);
}

class AuthLoginError extends AuthState {
  final String err;
  const AuthLoginError(this.err);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AuthLoginError && other.error == err;
  }

  @override
  int get hashCode => err.hashCode;
}

// signup
class AuthSignUpLoading extends AuthState {
  const AuthSignUpLoading() : super();
}

class AuthSignUpSuccess extends AuthState {
  const AuthSignUpSuccess() : super();
}

class AuthSignUpError extends AuthState {
  const AuthSignUpError() : super();
}

//logout
class AuthLogOut extends AuthState {
  const AuthLogOut();
}
