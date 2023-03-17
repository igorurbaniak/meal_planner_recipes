import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meal_planner_recipes/app/login/cubit/login_cubit.dart';
import 'package:meal_planner_recipes/app/login/widgets_login/email_input.dart';
import 'package:meal_planner_recipes/app/login/widgets_login/facebook_icon_button.dart';
import 'package:meal_planner_recipes/app/login/widgets_login/google_icon_button.dart';
import 'package:meal_planner_recipes/app/login/widgets_login/password_input.dart';
import 'package:meal_planner_recipes/app/login/widgets_login/snackbars.dart';
import 'package:meal_planner_recipes/app/reset_password/reset_password_page.dart';
import 'package:meal_planner_recipes/app/sign_up/sign_up_page.dart';
import 'package:meal_planner_recipes/features/login/widgets/login_background.dart';
import 'package:formz/formz.dart';
import 'package:meal_planner_recipes/utils/extensions.dart';

class LoggginPage extends StatefulWidget {
  LoggginPage({Key? key}) : super(key: key);

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nickController = TextEditingController();

  static Page page() => MaterialPage<void>(child: LoggginPage());

  @override
  State<LoggginPage> createState() => _LoggginPageState();
}

class _LoggginPageState extends State<LoggginPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listenWhen: ((previous, current) => previous.status != current.status),
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
                          'Sign in',
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
                                  TextInputField(
                                    emailController: widget.emailController,
                                    state: state,
                                  ),
                                  PasswordInputField(
                                    passwordController:
                                        widget.passwordController,
                                    state: state,
                                  ),
                                  TextButton(
                                    style: TextButton.styleFrom(
                                      foregroundColor: '#a4c1c1'.toColor(),
                                    ),
                                    onPressed: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: ((context) =>
                                              ForgotPasswordddPage()),
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
                                            .read<LoginCubit>()
                                            .logInWithCredentials();
                                      },
                                      child: const Padding(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 5),
                                        child: Text(
                                          'Login',
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 25),
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
                                  const SizedBox(height: 10),
                                  Row(
                                    children: const [
                                      Expanded(
                                        child: GoogleLargeIconButtonField(),
                                      ),
                                      SizedBox(width: 20),
                                      Expanded(
                                        child: FacebookLargeIconButtonField(),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 40),
                                  TextButton.icon(
                                    icon: const Icon(Icons.create),
                                    label: const Text('Create New Account'),
                                    style: TextButton.styleFrom(
                                        foregroundColor: Colors.white),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => SignnnUpPage(),
                                        ),
                                      );
                                    },
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









// class LoggginPage extends StatefulWidget {
//   LoggginPage({Key? key}) : super(key: key);

//   final emailController = TextEditingController();
//   final passwordController = TextEditingController();
//   final nickController = TextEditingController();

//   static Page page() => MaterialPage<void>(child: LoggginPage());

//   @override
//   State<LoggginPage> createState() => _LoggginPageState();
// }

// class _LoggginPageState extends State<LoggginPage> {
//   var errorMessage = '';
//   var isCreatingAccount = false;

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => LoginCubit(),
//       child: BlocConsumer<LoginCubit, LoginState>(
//         listenWhen: ((previous, current) => previous.status != current.status),
//         listener: (context, state) {
//           if (state.status.isFailure) {
//             ScaffoldMessenger.of(context).showSnackBar(
//               snackBarWhenFailure(
//                 snackBarFailureText: state.exceptionError,
//               ),
//             );
//           } else if (state.status.isSuccess) {
//             ScaffoldMessenger.of(context).showSnackBar(
//               snackBarWhenSuccess(),
//             );
//           }
//         },
//         builder: (context, state) {
//           return Stack(
//             children: [
//               const LoginBackGroundImage(),
//               Scaffold(
//                 backgroundColor: Colors.transparent,
//                 body: SingleChildScrollView(
//                   child: SafeArea(
//                     child: Column(
//                       children: [
//                         SizedBox(
//                           height: 160,
//                           child: Center(
//                             child: Align(
//                               alignment: const Alignment(0, 0.8),
//                               child: Text(
//                                 'Recipe for life',
//                                 style: GoogleFonts.pacifico(
//                                     fontSize: 42,
//                                     fontWeight: FontWeight.bold,
//                                     color: Colors.white),
//                               ),
//                             ),
//                           ),
//                         ),
//                         const SizedBox(height: 35),
//                         Text(
//                           isCreatingAccount == true ? 'Sign up' : 'Sign in',
//                           style: const TextStyle(
//                             color: Colors.white,
//                             fontSize: 25,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         Container(
//                           padding: const EdgeInsets.symmetric(horizontal: 40.0),
//                           child: Column(
//                             children: [
//                               Column(
//                                 crossAxisAlignment: CrossAxisAlignment.end,
//                                 children: [
//                                   TextInputField(
//                                     emailController: widget.emailController,
//                                     state: state,
//                                   ),
//                                   PasswordInputField(
//                                     passwordController:
//                                         widget.passwordController,
//                                     state: state,
//                                   ),
//                                   if (isCreatingAccount == true) ...[
//                                     // NickInputField(
//                                     //   nickController: widget.nickController, state: state,
//                                     // ),
//                                   ],
//                                   if (isCreatingAccount == false) ...[
//                                     TextButton(
//                                       style: TextButton.styleFrom(
//                                         foregroundColor: '#a4c1c1'.toColor(),
//                                       ),
//                                       onPressed: () {
//                                         // Navigator.of(context).push(
//                                         //   MaterialPageRoute(
//                                         //     builder: ((context) =>
//                                         //         ForgotPasswordPageField(state: state,)),
//                                         //   ),
//                                         // );
//                                       },
//                                       child: const Text(
//                                         'Forgot Password?',
//                                         style: TextStyle(
//                                           fontSize: 14,
//                                           fontStyle: FontStyle.italic,
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ],
//                               ),
//                               Column(
//                                 children: [
//                                   const SizedBox(height: 25),
//                                   Container(
//                                     width: double.infinity,
//                                     decoration: BoxDecoration(
//                                       color: '#537979'.toColor(),
//                                       borderRadius: BorderRadius.circular(16),
//                                     ),
//                                     child: TextButton(
//                                       onPressed: () async {
//                                         if (isCreatingAccount == true) {
//                                           context
//                                               .read<SignUpCubit>()
//                                               .signUpWithCredentials();
//                                           // try {
//                                           //   await FirebaseAuth.instance
//                                           //       .createUserWithEmailAndPassword(
//                                           //     email: widget.emailController.text
//                                           //         .trim(),
//                                           //     password: widget
//                                           //         .passwordController.text
//                                           //         .trim(),
//                                           //   );
//                                           // } catch (error) {
//                                           //   setState(() {
//                                           //     errorMessage = error.toString();
//                                           //   });
//                                           //   print(error);
//                                           // }
//                                         } else {
//                                           context
//                                               .read<LoginCubit>()
//                                               .logInWithCredentials();
//                                           // try {
//                                           //   await FirebaseAuth.instance
//                                           //       .signInWithEmailAndPassword(
//                                           //     email: widget.emailController.text
//                                           //         .trim(),
//                                           //     password: widget
//                                           //         .passwordController.text
//                                           //         .trim(),
//                                           //   );
//                                           // } catch (error) {
//                                           //   setState(() {
//                                           //     errorMessage = error.toString();
//                                           //   });
//                                           //   print(error);
//                                           // }
//                                         }
//                                       },
//                                       child: Padding(
//                                         padding: const EdgeInsets.symmetric(
//                                             vertical: 5.0),
//                                         child: Text(
//                                           isCreatingAccount == true
//                                               ? 'Sign up'
//                                               : 'Login',
//                                           style: const TextStyle(
//                                             fontSize: 20,
//                                             color: Colors.white,
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                   const SizedBox(height: 25),
//                                   if (isCreatingAccount == false) ...[
//                                     Row(
//                                       children: [
//                                         Expanded(
//                                           child: Divider(
//                                             color:
//                                                 Colors.white.withOpacity(0.7),
//                                             thickness: 0.8,
//                                           ),
//                                         ),
//                                         const Text(
//                                           'Or sign in with',
//                                           style: TextStyle(
//                                             fontWeight: FontWeight.w500,
//                                             fontSize: 14,
//                                             color: Colors.white,
//                                           ),
//                                         ),
//                                         Expanded(
//                                           child: Divider(
//                                             color:
//                                                 Colors.white.withOpacity(0.7),
//                                             thickness: 0.8,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                     const SizedBox(height: 10),
//                                     Row(
//                                       children: const [
//                                         Expanded(
//                                           child: GoogleLargeIconButtonField(),
//                                         ),
//                                         SizedBox(
//                                           width: 20,
//                                         ),
//                                         Expanded(
//                                           child: FacebookLargeIconButtonField(),
//                                         ),
//                                       ],
//                                     ),
//                                   ],
//                                   const SizedBox(height: 40),
//                                   if (isCreatingAccount == false) ...[
//                                     TextButton.icon(
//                                       icon: const Icon(Icons.create),
//                                       label: const Text('Create New Account'),
//                                       style: TextButton.styleFrom(
//                                           foregroundColor: Colors.white),
//                                       onPressed: () {
//                                         setState(
//                                           () {
//                                             isCreatingAccount = true;
//                                           },
//                                         );
//                                       },
//                                     ),
//                                   ],
//                                   if (isCreatingAccount == true) ...[
//                                     Column(
//                                       children: [
//                                         const Text(
//                                           'Already have an account?',
//                                           style: TextStyle(
//                                             color: Colors.white,
//                                           ),
//                                         ),
//                                         TextButton(
//                                           onPressed: () {
//                                             Navigator.pop(context);
//                                           },
//                                           child: const Text(
//                                             'Sign in',
//                                             style: TextStyle(
//                                                 color: Colors.blue,
//                                                 fontSize: 20),
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ],
//                                 ],
//                               )
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//               state.status.isInProgress
//                   ? const Center(child: CircularProgressIndicator())
//                   : const SizedBox.shrink()
//             ],
//           );
//         },
//       ),
//     );
//   }
// }

