import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meal_planner_recipes/utils/extensions.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<ForgotPasswordPage> {
  final emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: ModalRoute.of(context)?.canPop == true
            ? IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back,
                  size: 40,
                ),
              )
            : null,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/login_background.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
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
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 35),
                const Padding(
                  padding: EdgeInsets.all(30),
                  child: Text(
                    'Receive an eamil adress to reset your password ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                Container(
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
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey[600]?.withOpacity(0.5),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: TextFormField(
                                    validator: (email) => email != null &&
                                            !EmailValidator.validate(email)
                                        ? 'Enter a valid email'
                                        : null,
                                    controller: emailController,
                                    keyboardType: TextInputType.emailAddress,
                                    textInputAction: TextInputAction.done,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                    decoration: InputDecoration(
                                      suffixIcon: IconButton(
                                        icon: const Icon(
                                          Icons.clear,
                                          color: Colors.black,
                                        ),
                                        onPressed: () {
                                          emailController.clear();
                                        },
                                      ),
                                      contentPadding:
                                          const EdgeInsets.symmetric(
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
                                ),
                              ],
                            ),
                          ),
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
                              onPressed: () {
                                resetPassword();
                              },
                              child: const Padding(
                                padding: EdgeInsets.symmetric(vertical: 5.0),
                                child: Text(
                                  'Reset Password',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
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
    );
  }

  Future resetPassword() async {
    final snackbarmessenger = ScaffoldMessenger.of(context);

    // showDialog(
    //   barrierDismissible: false,
    //   context: context,
    //   builder: (context) {
    //     return const Center(child: CircularProgressIndicator());
    //   },
    // );

    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailController.text.trim());

      final correctEmailSnackBar = SnackBar(
        backgroundColor: Colors.green,
        content: const Padding(
          padding: EdgeInsets.only(right: 70),
          child: Text(
            'Password reset, link sent! Check your email!',
            style: TextStyle(
              fontSize: 14,
              color: Colors.white,
            ),
          ),
        ),
        action: SnackBarAction(
          textColor: Colors.black54,
          label: 'Undo',
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar;
          },
        ),
      );
      snackbarmessenger.showSnackBar(correctEmailSnackBar);
    } on FirebaseAuthException catch (e) {
      final wrongEmailSnackBar = SnackBar(
        backgroundColor: Colors.red[400],
        content: Text(
          e.message.toString(),
          style: const TextStyle(
            fontSize: 14,
            color: Colors.white,
          ),
        ),
        action: SnackBarAction(
          textColor: Colors.black54,
          label: 'Undo',
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar;
          },
        ),
      );
      snackbarmessenger.showSnackBar(wrongEmailSnackBar);
    }
  }
}
