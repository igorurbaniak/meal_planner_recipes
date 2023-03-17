import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_planner_recipes/app/core/enums.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit()
      : super(
          const AuthState(
            user: null,
            isLoading: false,
            errorMessage: '',
            status: Status.initial
          ),
        );

  StreamSubscription? _streamSubscription;

  Future<void> signOut() async {
    FirebaseAuth.instance.signOut();
  }

  Future<void> start() async {
    emit(
      const AuthState(
        user: null,
        isLoading: true,
        errorMessage: '',
        status: Status.loading
      ),
    );

    _streamSubscription = FirebaseAuth.instance.authStateChanges().listen(
      (user) {
        emit(
          AuthState(
            user: user,
            isLoading: false,
            errorMessage: '',
            status: Status.success
          ),
        );
      },
    )..onError(
        (error) {
          emit(
            AuthState(
              user: null,
              isLoading: false,
              errorMessage: error.toString(),
              status: Status.error
            ),
          );
        },
      );
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
