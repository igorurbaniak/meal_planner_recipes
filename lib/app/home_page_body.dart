import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_planner_recipes/app/login/cubit/login_cubit.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return Center(
          child: CupertinoButton(
            padding: const EdgeInsets.all(10),
            disabledColor: Colors.blueAccent.withOpacity(0.6),
            color: Colors.blueAccent,
            onPressed: () => context.read<LoginCubit>().signOut(),
            child: SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              height: MediaQuery.of(context).size.height / 20,
              child: const Center(
                child: Text(
                  'Logout',
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
