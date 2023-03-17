import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meal_planner_recipes/app/login/cubit/login_cubit.dart';
import 'package:meal_planner_recipes/features/profile/widgets/data_firebase_help.dart';
import 'package:meal_planner_recipes/features/profile/widgets/pictures_to_profile_page.dart.dart';
import 'package:meal_planner_recipes/features/profile/widgets/recipes_and_favourites.dart';
import 'package:meal_planner_recipes/utils/extensions.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class ProfileViewVol extends StatefulWidget {
  const ProfileViewVol({
    Key? key,
    // required this.user,
  }) : super(key: key);

  // final User user;

  @override
  State<ProfileViewVol> createState() => _ProfileViewVolState();
}

class _ProfileViewVolState extends State<ProfileViewVol> {
  File? image;

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imagePermanent = await saveImagePermanently(image.path);
      setState(() => this.image = imagePermanent);
    } on PlatformException catch (e) {
      // ignore: avoid_print
      print('Failed to pick image: $e');
    }
  }

  Future pickImageCamera() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      if (image == null) return;
      final imagePermanent = await saveImagePermanently(image.path);
      setState(() => this.image = imagePermanent);
    } on PlatformException catch (e) {
      // ignore: avoid_print
      print('Failed to pick image: $e');
    }
  }

  Future<File> saveImagePermanently(String imagePath) async {
    final directory = await getApplicationDocumentsDirectory();
    final name = basename(imagePath);
    final image = File('${directory.path}/$name');

    return File(imagePath).copy(image.path);
  }

  final List<String> listItem = [
    'images/bolognese.jpg',
    'images/chicken.jpg',
    'images/garlic.jpg',
    'images/mignon.jpg',
    'images/salad.jpg',
    'images/salad.jpg',
  ];

  bool isSigningOut = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: '#f5f5f0'.toColor(),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    CircleAvatar(
                      radius: 75,
                      backgroundColor: '#a4c1c1'.toColor(),
                      child: CircleAvatar(
                        radius: 70,
                        child: ClipOval(
                          child: (image != null)
                              ? Image.file(
                                  image!,
                                  fit: BoxFit.cover,
                                  width: MediaQuery.of(context).size.width,
                                  height: MediaQuery.of(context).size.height,
                                )
                              : Image.asset(
                                  'images/avatar.jpg',
                                  fit: BoxFit.cover,
                                  width: MediaQuery.of(context).size.width,
                                  height: MediaQuery.of(context).size.height,
                                ),
                        ),
                      ),
                    ),
                    CircleAvatar(
                      backgroundColor: '#95D0D0'.toColor(),
                      child: IconButton(
                        onPressed: () {
                          showModalBottomSheet(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            context: context,
                            builder: (context) => Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ListTile(
                                    leading: const Icon(Icons.image),
                                    title: const Text('Gallery'),
                                    onTap: () =>
                                        Navigator.of(context).pop(pickImage())
                                    // Navigator.of(context).pop(MaterialPageRoute(builder: (context) => HomePage(image: image)))
                                    ),
                                ListTile(
                                  leading: const Icon(Icons.camera_alt),
                                  title: const Text('Camera'),
                                  onTap: () => Navigator.of(context)
                                      .pop(pickImageCamera()),
                                ),
                              ],
                            ),
                          );
                        },
                        icon: const Icon(
                          Icons.edit,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Igor Urbaniak',
                  style: GoogleFonts.prozaLibre(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade800,
                  ),
                ),
              ),
              // Text(
              //   'Jestes zalogowany jako ${widget.user.email}',
              //   style: GoogleFonts.prozaLibre(
              //     fontSize: 12,
              //     fontWeight: FontWeight.bold,
              //     color: Colors.grey.shade800,
              //   ),
              // ),
              ElevatedButton(
                child: const Text('Wyloguj'),
                onPressed: () {
                  context.read<LoginCubit>().signOut();
                },
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IntrinsicHeight(
                  child: IntrinsicHeight(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Text(
                              '2200',
                              style: GoogleFonts.prozaLibre(
                                fontSize: 18,
                                fontWeight: FontWeight.w900,
                                color: Colors.grey.shade800,
                              ),
                            ),
                            const SizedBox(height: 15),
                            Text(
                              'Daily Calories',
                              style: GoogleFonts.prozaLibre(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey.shade600,
                              ),
                            ),
                          ],
                        ),
                        VerticalDivider(
                          color: Colors.grey.shade300,
                          thickness: 1,
                        ),
                        Column(
                          children: [
                            Text(
                              '32',
                              style: GoogleFonts.prozaLibre(
                                fontSize: 18,
                                fontWeight: FontWeight.w900,
                                color: Colors.grey.shade800,
                              ),
                            ),
                            const SizedBox(height: 15),
                            Text(
                              'Recipes',
                              style: GoogleFonts.prozaLibre(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey.shade600,
                              ),
                            ),
                          ],
                        ),
                        VerticalDivider(
                          color: Colors.grey.shade300,
                          thickness: 1,
                        ),
                        Column(
                          children: [
                            Text(
                              '50',
                              style: GoogleFonts.prozaLibre(
                                fontSize: 18,
                                fontWeight: FontWeight.w900,
                                color: Colors.grey.shade800,
                              ),
                            ),
                            const SizedBox(height: 15),
                            Text(
                              'Favourites',
                              style: GoogleFonts.prozaLibre(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey.shade600,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                color: '#f5f5f0'.toColor(),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: const [
                    RecipesAndFavourites(),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              const UserRecipesss(),
              // const UserRecipes(),
            ],
          ),
        ),
      ),
    );
  }
}
