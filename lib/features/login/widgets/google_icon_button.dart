import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meal_planner_recipes/features/auth/authentication.dart';
import 'package:meal_planner_recipes/features/profile/profile_page.dart';

class GoogleLargeIconButton extends StatefulWidget {
  const GoogleLargeIconButton({
    Key? key,
    required this.buttonName,
    required this.iconImage,
  }) : super(key: key);

  final String buttonName, iconImage;

  @override
  State<GoogleLargeIconButton> createState() => _GoogleLargeIconButton();
}

class _GoogleLargeIconButton extends State<GoogleLargeIconButton> {
  bool isSigningIn = false;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () async {
        setState(
          () {
            isSigningIn = true;
          },
        );
        User? user =
            await Authentication.signInWithGoogle(context: context);

        setState(
          () {
            isSigningIn = false;
          },
        );
        if (user != null) {
          if (!mounted) return;
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => const ProfilePage(
                // user: user,
              ),
            ),
          );
        }
        // final provider =
        //     Provider.of<GoogleSignInProvider>(context, listen: false);
        // provider.googleLogin();
      },
      style: TextButton.styleFrom(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          )),
      child: SizedBox(
        height: 30,
        child: Row(
          children: [
            const SizedBox(
              width: 15,
            ),
            Expanded(
              flex: 1,
              child: SizedBox(
                height: 35,
                child: Image.asset(
                  widget.iconImage,
                ),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              flex: 3,
              child: Text(
                widget.buttonName,
                style: const TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
