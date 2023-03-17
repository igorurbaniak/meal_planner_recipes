import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:formz/formz.dart';
import 'package:meal_planner_recipes/domain/models/auth/email.dart';
import 'package:meal_planner_recipes/domain/models/auth/name.dart';
import 'package:meal_planner_recipes/domain/models/auth/password.dart';
import 'package:meal_planner_recipes/domain/models/auth/reset_password.dart';

part 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit() : super(ResetPasswordState());

  final FirebaseAuth _authentication = FirebaseAuth.instance;

  void resetPassword() async {
    try {
      emit(
        state.copyWith(
          status: FormzSubmissionStatus.inProgress,
        ),
      );
      await _authentication.sendPasswordResetEmail(
        email: state.email.value,
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
          exceptionError: "Unexpected error please try again later",
          status: FormzSubmissionStatus.failure,
        ),
      );
    }
  }

  void resetPasswordChanged(String value) {
    final resetPassword = ResetPassword.dirty(value);
    emit(
      state.copyWith(
        resetPassword: resetPassword,
        email: state.email,
        password: state.password,
        name: state.name,
        // Formz.validate(
        //   [state.name, state.email, state.password, resetPassword],
        // ),
      ),
    );
  }
}
