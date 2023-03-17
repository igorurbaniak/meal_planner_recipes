import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meal_planner_recipes/utils/extensions.dart';

class PasswordInput extends StatefulWidget {
  const PasswordInput({super.key, required this.passwordController});

  final TextEditingController passwordController;

  @override
  State<PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[600]?.withOpacity(0.5),
              borderRadius: BorderRadius.circular(16),
            ),
            child: TextFormField(
              keyboardType: TextInputType.text,
              controller: widget.passwordController,
              obscureText: _isObscure,
              textInputAction: TextInputAction.next,
              style: const TextStyle(fontSize: 20, color: Colors.white),
              onChanged: (text) {
                setState(() {});
              },
              decoration: InputDecoration(
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
          ),
        ],
      ),
    );
  }
}
