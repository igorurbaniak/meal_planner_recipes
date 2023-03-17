import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meal_planner_recipes/app/login/cubit/login_cubit.dart';
import 'package:meal_planner_recipes/domain/models/auth/email.dart';
import 'package:meal_planner_recipes/utils/extensions.dart';

class TextInputField extends StatelessWidget {
   const TextInputField({
    Key? key,
    required this.emailController,
    required this.state,
  }) : super(key: key);

  final TextEditingController emailController;
  final LoginState state;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Stack(children: [
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
                context.read<LoginCubit>().emailChanged(email);
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
          ]),
        ],
      ),
    );
  }
}
