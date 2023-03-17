// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:meal_planner_recipes/app/cubit/root_cubit.dart';
// import 'package:meal_planner_recipes/bottom_navigatrion_bar.dart';
// import 'package:meal_planner_recipes/features/auth/cubit/auth_cubit.dart';
// import 'package:meal_planner_recipes/features/auth/provider/google_sign_in.dart';
// import 'package:meal_planner_recipes/features/login/login_page.dart';
// import 'package:provider/provider.dart';

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) => ChangeNotifierProvider(
//         create: (context) => GoogleSignInProvider(),
//         child: MaterialApp(
//           debugShowCheckedModeBanner: false,
//           title: 'Meal planner',
//           theme: ThemeData(primarySwatch: Colors.blueGrey),
//           home: const PageAuth(),
//         ),
//       );
// }

// class PageAuth extends StatelessWidget {
//   const PageAuth({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => RootCubit()..start(),
//       child: BlocBuilder<RootCubit, RootState>(
//         builder: (context, state) {
//           final user = state.user;
//           // if (snapshot.connectionState == ConnectionState.waiting) {
//           //   return const Center(child: CircularProgressIndicator());
//           // } else if (snapshot.hasData) {
//           //   return HomePage(user: user);
//           // } else if (snapshot.hasError) {
//           //   return const Center(
//           //     child: Text('Something went wrong!'),
//           //   );
//           // }
//           if (user == null) {
//             return LoginPage();
//           }
//           return BottomNavigatorBar(user: user);
//         },
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:meal_planner_recipes/app/auth/auth_page.dart';
// import 'package:meal_planner_recipes/app/auth/cubit/auth_cubit.dart';

// class AppWidget extends StatelessWidget {
//   const AppWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Material App',
//       home: BlocProvider(
//         lazy: false,
//         create: (_) => AuthenticationCubit(),
//         child: const AuthenticationPage(),
//       ),
//     );
//   }
// }
