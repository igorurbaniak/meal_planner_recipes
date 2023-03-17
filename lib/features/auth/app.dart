import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_planner_recipes/app/auth/auth_page.dart';
import 'package:meal_planner_recipes/app/auth/cubit/auth_cubit.dart';
import 'package:meal_planner_recipes/bottom_navigatrion_bar.dart';
import 'package:meal_planner_recipes/features/auth/cubit/auth_cubit.dart';
import 'package:meal_planner_recipes/features/login/login_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // ChangeNotifierProvider(
    //   create: (context) => GoogleSignInProvider(), child:
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      title: 'Meal planner',
      home: BlocProvider(
        lazy: false,
        create: (_) => AuthenticationCubit(),
        child: const AuthenticationPage(),
      ),
    );

    // MaterialApp(
    // debugShowCheckedModeBanner: false,
    // title: 'Meal planner',
    // theme: ThemeData(primarySwatch: Colors.blueGrey),
    // home: const AppWidget(),
    // const PageAuth(),
    // );
    // );
  }
}

class PageAuth extends StatelessWidget {
  const PageAuth({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit()..start(),
      child: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          final user = state.user;
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.errorMessage.isNotEmpty) {
            return Center(
              child: Text(
                'Something went wrong: ${state.errorMessage.toString()}',
              ),
            );
          }
          if (user == null) {
            return LoginPage();
          }
          return const BottomNavigatorBar(
              // user: user
              );
        },
      ),
    );
  }
}
