import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meal_planner_recipes/app/sign_up/cubit/sign_up_cubit.dart';
import 'package:meal_planner_recipes/utils/extensions.dart';

class SignUpEmailInput extends StatelessWidget {
  const SignUpEmailInput(
      {super.key, required this.state, required this.emailController});

  final TextEditingController emailController;
  final SignUpState state;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 62,
                decoration: BoxDecoration(
                  color: Colors.grey[600]?.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                style: const TextStyle(fontSize: 20, color: Colors.white),
                onChanged: (email) {
                  context.read<SignUpCubit>().emailChanged(email);
                },
                decoration: InputDecoration(
                   errorStyle: const TextStyle(fontSize: 13, letterSpacing: 0.3),
                  errorText: state.email.error?.name,
                  border: InputBorder.none,
                  hintText: 'Email',
                  hintStyle: const TextStyle(
                      fontStyle: FontStyle.italic,
                      fontSize: 20,
                      color: Colors.white),
                  suffixIcon: IconButton(
                    icon: const Icon(
                      Icons.clear,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      emailController.clear();
                    },
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 18),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(top: 8, left: 20, right: 20),
                    child: FaIcon(
                      FontAwesomeIcons.solidEnvelope,
                      color: '#a4c1c1'.toColor(),
                      size: 30,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
