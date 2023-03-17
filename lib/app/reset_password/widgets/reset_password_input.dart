import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meal_planner_recipes/app/sign_up/cubit/sign_up_cubit.dart';
import 'package:meal_planner_recipes/utils/extensions.dart';

class ResetPasswordInput extends StatelessWidget {
  const ResetPasswordInput({super.key, required this.emailController});

  final TextEditingController emailController;
  // final SignUpState state;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40.0),
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                ),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[600]?.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        TextFormField(
                          onChanged: (resetPassword) => context
                              .read<SignUpCubit>()
                              .resetPasswordChanged(resetPassword),
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.done,
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                          decoration: InputDecoration(
                            errorStyle: const TextStyle(
                                fontSize: 13, letterSpacing: 0.3),
                            suffixIcon: IconButton(
                              icon: const Icon(
                                Icons.clear,
                                color: Colors.black,
                              ),
                              onPressed: () {
                                emailController.clear();
                              },
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 18,
                            ),
                            prefixIcon: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                              ),
                              child: Icon(
                                FontAwesomeIcons.solidEnvelope,
                                color: '#a4c1c1'.toColor(),
                                size: 30,
                              ),
                            ),
                            border: InputBorder.none,
                            hintText: 'Email',
                            hintStyle: const TextStyle(
                              fontStyle: FontStyle.italic,
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
