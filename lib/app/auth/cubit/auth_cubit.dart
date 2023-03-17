import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'auth_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit() : super(const AuthenticationState(isSignedIn: false)) {
    FirebaseAuth.instance.authStateChanges().listen(
      (User? user) {
        if (user == null) {
          return emit(
            state.copyWith(
              isSignedIn: false,
            ),
          );
        } else {
          emit(
            state.copyWith(
              isSignedIn: true,
            ),
          );
        }
      },
    );
  }
}
