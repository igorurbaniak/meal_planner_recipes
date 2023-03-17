import 'package:flutter/material.dart';



class FacebookLargeIconButton extends StatefulWidget {
  const FacebookLargeIconButton({
    Key? key,
    required this.buttonName,
    required this.iconImage,
  }) : super(key: key);

  final String buttonName, iconImage;

  @override
  State<FacebookLargeIconButton> createState() => _FacebookLargeIconButton();
}

class _FacebookLargeIconButton extends State<FacebookLargeIconButton> {
  bool isSigningIn = false;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        // signInWithFacebookk();
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

  // void signInWithFacebookk() async {
  //   try {
  //     final LoginResult result = await FacebookAuth.instance
  //         .login(permissions: (['email', 'public_profile']));
  //     final token = result.accessToken!.token;
  //     print(
  //         'Facebook token userID : ${result.accessToken!.grantedPermissions}');
  //     final graphResponse = await http.get(Uri.parse(
  //         'https://graph.facebook.com/'
  //         'v2.12/me?fields=name,first_name,last_name,email&access_token=${token}'));

  //     final profile = jsonDecode(graphResponse.body);
  //     print("Profile is equal to $profile");


  //     try {
  //       final AuthCredential facebookCredential =
  //           FacebookAuthProvider.credential(result.accessToken!.token);
  //       final userCredential = await FirebaseAuth.instance
  //           .signInWithCredential(facebookCredential);
  //       Navigator.push(
  //         context,
  //         MaterialPageRoute(builder: (context) => const PrivacyPolicyPage()),
  //       );
  //     } catch (e) {
  //       final snackBar = SnackBar(
  //         margin: const EdgeInsets.all(20),
  //         behavior: SnackBarBehavior.floating,
  //         content: Text(e.toString()),
  //         backgroundColor: (Colors.redAccent),
  //         action: SnackBarAction(
  //           label: 'dismiss',
  //           onPressed: () {},
  //         ),
  //       );
  //       ScaffoldMessenger.of(context).showSnackBar(snackBar);
  //     }
  //   } catch (e) {
  //     print("error occurred");
  //     print(e);
  //   }
  // }
}
