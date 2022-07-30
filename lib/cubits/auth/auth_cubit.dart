import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // login

  Future login(String email, String password) async {
    emit(const AuthLoginLoading());

    try {
      User? user = (await _firebaseAuth.signInWithEmailAndPassword(
              email: email, password: password))
          .user;

      if (user != null) {
        emit(AuthLoginSuccess(user: user));
      }
    } on FirebaseAuthException catch (e) {
      emit(AuthLoginError(e.message!));
    }
  }

  //signup

  Future signUp(String name, String email, String password) async {
    emit(const AuthSignUpLoading());

    try {
      User? user = (await _firebaseAuth.createUserWithEmailAndPassword(
              email: email, password: password))
          .user;
      if (user != null) {
        user.updateDisplayName(name);
        emit(const AuthSignUpSuccess());
      }
    } on FirebaseAuthException {
      emit(const AuthSignUpError());
    }
  }

  // logout
  Future logOut() async {
    await _firebaseAuth.signOut();
    emit(const AuthLogOut());
  }
}
