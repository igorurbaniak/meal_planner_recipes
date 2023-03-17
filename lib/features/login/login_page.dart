import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meal_planner_recipes/features/forgot_password_page/forgot_password_page.dart';
import 'package:meal_planner_recipes/features/login/widgets/email_input.dart';
import 'package:meal_planner_recipes/features/login/widgets/facebook_icon_button.dart';
import 'package:meal_planner_recipes/features/login/widgets/google_icon_button.dart';
import 'package:meal_planner_recipes/features/login/widgets/login_background.dart';
import 'package:meal_planner_recipes/features/login/widgets/nick_input.dart';
import 'package:meal_planner_recipes/features/login/widgets/password_input.dart';
import 'package:meal_planner_recipes/utils/extensions.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nickController = TextEditingController();

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var errorMessage = '';
  var isCreatingAccount = false;

  @override
  Widget build(BuildContext context) {
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
                  Text(
                    isCreatingAccount == true ? 'Sign up' : 'Sign in',
                    style: const TextStyle(
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
                            TextInput(
                              emailController: widget.emailController,
                            ),
                            PasswordInput(
                              passwordController: widget.passwordController,
                            ),
                            if (isCreatingAccount == true) ...[
                              NickInput(
                                nickController: widget.nickController,
                              ),
                            ],
                            if (isCreatingAccount == false) ...[
                              TextButton(
                                style: TextButton.styleFrom(
                                  foregroundColor: '#a4c1c1'.toColor(),
                                ),
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: ((context) =>
                                          const ForgotPasswordPage()),
                                    ),
                                  );
                                },
                                child: const Text(
                                  'Forgot Password?',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                              ),
                            ],
                          ],
                        ),
                        Column(
                          children: [
                            const SizedBox(
                              height: 25,
                            ),
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: '#537979'.toColor(),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: TextButton(
                                onPressed: () async {
                                  if (isCreatingAccount == true) {
                                    try {
                                      await FirebaseAuth.instance
                                          .createUserWithEmailAndPassword(
                                        email:
                                            widget.emailController.text.trim(),
                                        password: widget.passwordController.text
                                            .trim(),
                                      );
                                    } catch (error) {
                                      setState(() {
                                        errorMessage = error.toString();
                                      });
                                      // print(error);
                                    }
                                  } else {
                                    try {
                                      await FirebaseAuth.instance
                                          .signInWithEmailAndPassword(
                                        email:
                                            widget.emailController.text.trim(),
                                        password: widget.passwordController.text
                                            .trim(),
                                      );
                                    } catch (error) {
                                      setState(() {
                                        errorMessage = error.toString();
                                      });
                                      // print(error);
                                    }
                                  }
                                },
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 5.0),
                                  child: Text(
                                    isCreatingAccount == true
                                        ? 'Sign up'
                                        : 'Login',
                                    style: const TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            if (isCreatingAccount == false) ...[
                              Row(
                                children: [
                                  Expanded(
                                    child: Divider(
                                      color: Colors.white.withOpacity(0.7),
                                      thickness: 0.8,
                                    ),
                                  ),
                                  const Text(
                                    'Or sign in with',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Expanded(
                                    child: Divider(
                                      color: Colors.white.withOpacity(0.7),
                                      thickness: 0.8,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: const [
                                  Expanded(
                                    child: GoogleLargeIconButton(
                                      buttonName: 'Google',
                                      iconImage: 'images/google_icon.png',
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Expanded(
                                    child: FacebookLargeIconButton(
                                      buttonName: 'Facebook',
                                      iconImage: 'images/facebook_icon.png',
                                    ),
                                  ),
                                ],
                              ),
                            ],
                            const SizedBox(
                              height: 40,
                            ),
                            if (isCreatingAccount == false) ...[
                              TextButton.icon(
                                icon: const Icon(Icons.create),
                                label: const Text('Create New Account'),
                                style: TextButton.styleFrom(
                                  foregroundColor: Colors.white,
                                ),
                                onPressed: () {
                                  setState(() {
                                    isCreatingAccount = true;
                                  });
                                },
                              ),
                            ],
                            if (isCreatingAccount == true) ...[
                              Column(
                                children: [
                                  const Text(
                                    'Already have an account?',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      setState(
                                        () {
                                          isCreatingAccount = false;
                                        },
                                      );
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
      ],
    );
  }
}
