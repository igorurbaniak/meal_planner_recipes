import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_planner_recipes/app/login/cubit/login_cubit.dart';

class GoogleLargeIconButtonField extends StatelessWidget {
   const GoogleLargeIconButtonField({
    Key? key,
  }) : super(key: key);

  // bool isSigningIn = false;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => context.read<LoginCubit>().signInWithGoogle(),

      // setState(
      //   () {
      //     isSigningIn = true;
      //   },
      // );
      // User? user =
      //     await Authentication.signInWithGoogle(context: context);

      // setState(
      //   () {
      //     isSigningIn = false;
      //   },
      // );
      // if (user != null) {
      //   if (!mounted) return;
      //   Navigator.of(context).pushReplacement(
      //     MaterialPageRoute(
      //       builder: (context) => ProfilePage(
      //         user: user,
      //       ),
      //     ),
      //   );
      // }
      // final provider =
      //     Provider.of<GoogleSignInProvider>(context, listen: false);
      // provider.googleLogin();
      style: TextButton.styleFrom(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: SizedBox(
        height: 30,
        child: Row(
          children: [
            const SizedBox(width: 15),
            Expanded(
              flex: 1,
              child: SizedBox(
                height: 35,
                child: Image.asset(
                  'images/google_icon.png',
                ),
              ),
            ),
            const SizedBox(width: 15),
            const Expanded(
              flex: 3,
              child: Text(
                'Google',
                style: TextStyle(
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
