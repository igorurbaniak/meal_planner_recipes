import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_planner_recipes/app/home_page_body.dart';
import 'package:meal_planner_recipes/app/login/cubit/login_cubit.dart';

class HomeeePage extends StatelessWidget {
  const HomeeePage({super.key});

  static Page page() => const MaterialPage<void>(child: HomeeePage());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (_) => LoginCubit(),
        child: const HomePageBody(),
      ),
    );
  }
}
