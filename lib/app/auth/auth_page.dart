import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_planner_recipes/app/auth/cubit/auth_cubit.dart';
import 'package:meal_planner_recipes/app/login/login_page.dart';
import 'package:meal_planner_recipes/bottom_navigatrion_bar.dart';

class AuthenticationPage extends StatelessWidget {
  const AuthenticationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FlowBuilder<AuthenticationState>(
      state: context.select((AuthenticationCubit cubit) => cubit.state),
      onGeneratePages: (authState, pages) {
        if (authState.isSignedIn) {
          return [LoggginPage.page()];
        } else {
          return [LoggginPage.page()];
        }
      },
    );
  }
}
