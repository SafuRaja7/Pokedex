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
  const AuthLoginError({String? error}) : super(error: error);
}

// signup
class AuthSignUpLoading extends AuthState {
  const AuthSignUpLoading() : super();
}

class AuthSignUpSuccess extends AuthState {
  const AuthSignUpSuccess() : super();
}

class AuthSignUpError extends AuthState {
  final String? errorr;
  const AuthSignUpError(this.errorr);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AuthSignUpError && other.errorr == errorr;
  }

  @override
  int get hashCode => errorr.hashCode;
}

//logout
class AuthLogOut extends AuthState {
  const AuthLogOut();
}
