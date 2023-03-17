import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:meal_planner_recipes/app/login/cubit/login_cubit.dart';

class FacebookLargeIconButtonField extends StatelessWidget {
  const FacebookLargeIconButtonField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () async {
        context.read<LoginCubit>().signInWithFacebook();
      },
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
                  'images/facebook_icon.png',
                ),
              ),
            ),
            const SizedBox(width: 15),
            const Expanded(
              flex: 3,
              child: Text(
                'Facebook',
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
