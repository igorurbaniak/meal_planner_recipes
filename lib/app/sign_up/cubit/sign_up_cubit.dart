import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:formz/formz.dart';
import 'package:meal_planner_recipes/domain/models/auth/email.dart';
import 'package:meal_planner_recipes/domain/models/auth/name.dart';
import 'package:meal_planner_recipes/domain/models/auth/password.dart';
import 'package:meal_planner_recipes/domain/models/auth/reset_password.dart';
part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpState());

  final FirebaseAuth _authentication = FirebaseAuth.instance;

  void emailChanged(String value) {
    final email = Email.dirty(value);
    emit(
      state.copyWith(
        email: email,
        password: state.password,
        name: state.name,
        // Formz.validate(
        //   [state.name, email, state.password],
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
          name: state.name,
          // status: Formz.validate(
          //   [state.name, state.email, password],
          // ),
        ),
      );
    }

    void resetPasswordChanged(String value) {
      final resetPassword = ResetPassword.dirty(value);
      emit(
        state.copyWith(
          resetPassword: resetPassword,
          email: state.email,
          password: state.password,
          name: state.name,
        ),
      );
    }

    void nameChanged(String value) {
      final name = Name.dirty(value);
      emit(
        state.copyWith(
          name: name, email: state.email, password: state.password,
          // status: Formz.validate(
          //   [name, state.email, state.password],
          // ),
        ),
      );
    }

    Future<void> signUpWithCredentials() async {
      try {
        emit(
          state.copyWith(
            status: FormzSubmissionStatus.inProgress,
          ),
        );
        await _authentication.createUserWithEmailAndPassword(
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
            exceptionError: 'Unexpected error please try again later',
            status: FormzSubmissionStatus.failure,
          ),
        );
      }
    }
}

