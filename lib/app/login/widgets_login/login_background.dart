import 'package:flutter/material.dart';

class LoginBackGroundImage extends StatelessWidget {
  const LoginBackGroundImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/login_background.jpg"),
          fit: BoxFit.cover,
        ),
      ),
    ));
  }
}
