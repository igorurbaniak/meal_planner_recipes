import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:formz/formz.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:meal_planner_recipes/domain/models/auth/email.dart';
import 'package:meal_planner_recipes/domain/models/auth/password.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginState());

  final FirebaseAuth _authentication = FirebaseAuth.instance;

  void emailChanged(String value) {
    final email = Email.dirty(value);
    emit(
      state.copyWith(
        email: email,
        password: state.password,
        // status:
        // Formz.validate(
        //   [email, state.password],
        // ),
      ),
    );
  }

  void passwordChanged(String value) {
    final password = Password.dirty(value);
    emit(
      state.copyWith(
        password: password,
        email: state.email,
        // status: Formz.validate(
        //   [state.email, password],
        // ),
      ),
    );
  }

  Future<void> logInWithCredentials() async {
    try {
      emit(
        state.copyWith(
          status: FormzSubmissionStatus.inProgress,
        ),
      );
      await _authentication.signInWithEmailAndPassword(
        email: state.email.value,
        password: state.password.value,
      );
      emit(
        state.copyWith(
          status: FormzSubmissionStatus.success,
        ),
      );
    } on FirebaseAuthException catch (error) {
      emit(
        state.copyWith(
          exceptionError: error.message.toString(),
          status: FormzSubmissionStatus.failure,
        ),
      );
    } on PlatformException catch (error) {
      emit(
        state.copyWith(
          exceptionError: error.message.toString(),
          status: FormzSubmissionStatus.failure,
        ),
      );
    } catch (error) {
      emit(
        state.copyWith(
          exceptionError: 'Unexpected error, please try again later',
          status: FormzSubmissionStatus.failure,
        ),
      );
    }
  }

  Future<void> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    try {
      emit(
        state.copyWith(
          status: FormzSubmissionStatus.inProgress,
        ),
      );
      _authentication.signInWithCredential(credential);
      emit(
        state.copyWith(
          status: FormzSubmissionStatus.success,
        ),
      );
    } on FirebaseAuthException catch (error) {
      emit(
        state.copyWith(
          exceptionError: error.message.toString(),
          status: FormzSubmissionStatus.failure,
        ),
      );
    } on PlatformException catch (error) {
      emit(
        state.copyWith(
          exceptionError: error.message.toString(),
          status: FormzSubmissionStatus.failure,
        ),
      );
    } catch (error) {
      emit(
        state.copyWith(
          exceptionError: 'Unexpected error, please try again later',
          status: FormzSubmissionStatus.failure,
        ),
      );
    }
  }

  Future<void> signInWithFacebook() async {
  
  final LoginResult loginResult = await FacebookAuth.instance.login();

  final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.token);

    try {
      emit(
        state.copyWith(
          status: FormzSubmissionStatus.inProgress,
        ),
      );
      _authentication.signInWithCredential(facebookAuthCredential);
      emit(
        state.copyWith(
          status: FormzSubmissionStatus.success,
        ),
      );
    } on FirebaseAuthException catch (error) {
      emit(
        state.copyWith(
          exceptionError: error.message.toString(),
          status: FormzSubmissionStatus.failure,
        ),
      );
    } on PlatformException catch (error) {
      emit(
        state.copyWith(
          exceptionError: error.message.toString(),
          status: FormzSubmissionStatus.failure,
        ),
      );
    } catch (error) {
      emit(
        state.copyWith(
          exceptionError: 'Unexpected error, please try again later',
          status: FormzSubmissionStatus.failure,
        ),
      );
    }
  }

  Future<void> resetPassword() async {
    try {
      emit(
        state.copyWith(
          status: FormzSubmissionStatus.inProgress,
        ),
      );
      await _authentication.sendPasswordResetEmail(email: state.email.value);
      emit(
        state.copyWith(
          status: FormzSubmissionStatus.success,
        ),
      );
    } on FirebaseAuthException catch (error) {
      emit(
        state.copyWith(
          exceptionError: error.message.toString(),
          status: FormzSubmissionStatus.failure,
        ),
      );
    } on PlatformException catch (error) {
      emit(
        state.copyWith(
          exceptionError: error.message.toString(),
          status: FormzSubmissionStatus.failure,
        ),
      );
    } catch (error) {
      emit(
        state.copyWith(
          exceptionError: 'Unexpected error, please try again later',
        ),
      );
    }
  }

  Future<void> signOut() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();

    try {
      emit(
        state.copyWith(
          status: FormzSubmissionStatus.inProgress,
        ),
      );
      await googleSignIn.signOut();
      await _authentication.signOut();
      emit(
        state.copyWith(
          status: FormzSubmissionStatus.success,
        ),
      );
    } on FirebaseAuthException catch (error) {
      emit(
        state.copyWith(
          exceptionError: error.message.toString(),
          status: FormzSubmissionStatus.failure,
        ),
      );
    } on PlatformException catch (error) {
      emit(
        state.copyWith(
          exceptionError: error.message.toString(),
          status: FormzSubmissionStatus.failure,
        ),
      );
    } catch (error) {
      emit(
        state.copyWith(
          exceptionError: 'Unexpected error, please try again later',
        ),
      );
    }
  }
}
