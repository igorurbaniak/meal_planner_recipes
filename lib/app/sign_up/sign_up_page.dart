import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meal_planner_recipes/app/login/widgets_login/login_background.dart';
import 'package:meal_planner_recipes/app/login/widgets_login/snackbars.dart';
import 'package:meal_planner_recipes/app/sign_up/cubit/sign_up_cubit.dart';
import 'package:meal_planner_recipes/app/sign_up/widgets/sign_up_email_input.dart';
import 'package:meal_planner_recipes/app/sign_up/widgets/sign_up_password_input.dart';
import 'package:meal_planner_recipes/utils/extensions.dart';

class SignnnUpPage extends StatefulWidget {
  SignnnUpPage({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nickController = TextEditingController();

  @override
  State<SignnnUpPage> createState() => _SignnnUpPageState();
}

class _SignnnUpPageState extends State<SignnnUpPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(),
      child: BlocConsumer<SignUpCubit, SignUpState>(
        listener: (context, state) {
          if (state.status.isFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              snackBarWhenFailure(
                snackBarFailureText: state.exceptionError,
              ),
            );
          } else if (state.status.isSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              snackBarWhenSuccess(),
            );
          }
        },
        builder: (context, state) {
          return Stack(
            children: [
              const LoginBackGroundImage(),
              Scaffold(
                backgroundColor: Colors.transparent,
                body: SingleChildScrollView(
                  child: SafeArea(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 160,
                          child: Center(
                            child: Align(
                              alignment: const Alignment(0, 0.8),
                              child: Text(
                                'Recipe for life',
                                style: GoogleFonts.pacifico(
                                    fontSize: 42,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 35),
                        const Text(
                          'Sign up',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 40.0),
                          child: Column(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  SignUpEmailInput(
                                    emailController: widget.emailController,
                                    state: state,
                                  ),
                                  SignUpPasswordInput(
                                    passwordController: widget.passwordController,
                                    state: state,
                                  ),
                                  // NickInputField(
                                  //   nickController: widget.nickController,
                                  //   state: state,
                                  // ),
                                ],
                              ),
                              Column(
                                children: [
                                  const SizedBox(height: 25),
                                  Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: '#537979'.toColor(),
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    child: TextButton(
                                      onPressed: () {
                                        context
                                            .read<SignUpCubit>()
                                            .signUpWithCredentials();
                                      },
                                      child: const Padding(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 5.0),
                                        child: Text(
                                          'Sign up',
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 65),
                                  Column(
                                    children: [
                                      const Text(
                                        'Already have an account?',
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text(
                                          'Sign in',
                                          style: TextStyle(
                                              color: Colors.blue, fontSize: 20),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              state.status.isInProgress
                  ? const Center(child: CircularProgressIndicator())
                  : const SizedBox.shrink()
            ],
          );
        },
      ),
    );
  }
}
