import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meal_planner_recipes/app/sign_up/cubit/sign_up_cubit.dart';
import 'package:meal_planner_recipes/utils/extensions.dart';

class SignUpPasswordInput extends StatefulWidget {
  const SignUpPasswordInput(
      {super.key, required this.passwordController, required this.state});

  final TextEditingController passwordController;
  final SignUpState state;

  @override
  State<SignUpPasswordInput> createState() => _SignUpPasswordInputState();
}

class _SignUpPasswordInputState extends State<SignUpPasswordInput> {
  bool _isObscure = true;

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
                keyboardType: TextInputType.text,
                controller: widget.passwordController,
                obscureText: _isObscure,
                textInputAction: TextInputAction.next,
                style: const TextStyle(fontSize: 20, color: Colors.white),
                onChanged: (password) {
                  context.read<SignUpCubit>().passwordChanged(password);
                },
                decoration: InputDecoration(
                   errorStyle: const TextStyle(fontSize: 13, letterSpacing: 0.3),
                  errorText: widget.state.password.error?.name,
                  border: InputBorder.none,
                  hintText: 'Password',
                  hintStyle: const TextStyle(
                      fontStyle: FontStyle.italic,
                      fontSize: 20,
                      color: Colors.white),
                  suffixIcon: IconButton(
                    icon: Icon(
                        _isObscure ? Icons.visibility : Icons.visibility_off,
                        color: Colors.black),
                    onPressed: () {
                      setState(
                        () {
                          _isObscure = !_isObscure;
                        },
                      );
                    },
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 18),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(top: 8, left: 22, right: 22),
                    child: FaIcon(FontAwesomeIcons.lock,
                        color: '#a4c1c1'.toColor(), size: 30),
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
