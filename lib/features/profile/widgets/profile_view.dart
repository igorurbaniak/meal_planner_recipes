import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meal_planner_recipes/app/login/cubit/login_cubit.dart';
import 'package:meal_planner_recipes/features/profile/widgets/recipes_and_favourites.dart';
import 'package:meal_planner_recipes/utils/extensions.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({
    Key? key,
    // required this.user,
  }) : super(key: key);

  // final User user;

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
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
                  // setState(() {
                  //   isSigningOut = true;
                  // });
                  // await Authentication.signOut(context: context);
                  // setState(() {
                  //   isSigningOut = false;
                  // });
                  // if (!mounted) return;
                  // Navigator.of(context).push(
                  //   MaterialPageRoute(
                  //     builder: (context) => LoginPage(),
                  //   ),
                  // );

                  // context.read<AuthCubit>().signOut();
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
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  children: [
                    FutureBuilder(
                      future: _loadImages(),
                      builder: (context,
                          AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          return GridView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            gridDelegate:
                                const SliverGridDelegateWithMaxCrossAxisExtent(
                              mainAxisSpacing: 15,
                              mainAxisExtent: 100,
                              maxCrossAxisExtent: 160,
                              childAspectRatio: 3 / 2,
                              crossAxisSpacing: 20,
                            ),
                            itemCount: snapshot.data?.length,
                            itemBuilder: (context, index) {
                              final Map<String, dynamic> image =
                                  snapshot.data![index];

                              return Card(
                                semanticContainer: true,
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                // color: '#E1EAED'.toColor(),
                                elevation: 0.5,
                                child: InkWell(
                                  onLongPress: () {
                                    setState(
                                      () {
                                        // Navigator.push(
                                        //   context,
                                        //   MaterialPageRoute(
                                        //     builder: (context) => AddMealPage(),
                                        //   ),
                                        // );
                                        // AlertDialog(
                                        //   title:
                                        //       const Text('AlertDialog Title'),
                                        //   content: SingleChildScrollView(
                                        //     child: ListBody(
                                        //       children: const <Widget>[
                                        //         Text(
                                        //             'This is a demo alert dialog.'),
                                        //         Text(
                                        //             'Would you like to approve of this message?'),
                                        //       ],
                                        //     ),
                                        //   ),
                                        //   actions: <Widget>[
                                        //     TextButton(
                                        //       child: const Text('Approve'),
                                        //       onPressed: () {
                                        //         Navigator.of(context).pop();
                                        //       },
                                        //     ),
                                        //   ],
                                        // );
                                        showDialog(
                                            context: context,
                                            builder: (BuildContext ctx) {
                                              return AlertDialog(
                                                title: const Text(
                                                    'Please Confirm'),
                                                content: const Text(
                                                    'Are you sure you want to delete your own recipe?'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () {
                                                      setState(() {});
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: const Text('Yes'),
                                                  ),
                                                  TextButton(
                                                    onPressed: () {
                                                      Navigator.of(context,
                                                              rootNavigator:
                                                                  true)
                                                          .pop();
                                                    },
                                                    child: const Text('No'),
                                                  )
                                                ],
                                              );
                                            });
                                      },
                                    );
                                  },
                                  child: Container(
                                    height: 100,
                                    width: 160,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16),
                                      image: DecorationImage(
                                        opacity: 0.3,
                                        image: NetworkImage(image['url']),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 5,
                                            right: 5,
                                            bottom: 5,
                                            top: 40),
                                        child: Text(
                                          'Chicken with french fries',
                                          style: GoogleFonts.prozaLibre(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  // child: Opacity(
                                  //   opacity: 0.5,
                                  //   child: Image.network(
                                  //     image['url'],
                                  //     fit: BoxFit.cover,
                                  //   ),
                                  // ),
                                ),
                              );
                            },
                          );
                        }
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    ),
                  ],
                ),
              )

              // SizedBox(
              //   height: 300,
              //   width: 340,
              //   child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
              //       stream: FirebaseFirestore.instance
              //           .collection('categories')
              //           .snapshots(),
              //       builder: (context, snapshot) {
              //         if (snapshot.hasError) {
              //           return const Center(
              //             child: Text('An unexpected problem has occurred'),
              //           );
              //         }

              //         if (snapshot.connectionState ==
              //             ConnectionState.waiting) {
              //           return Center(
              //             child: Padding(
              //               padding: const EdgeInsets.only(bottom: 100),
              //               child: SizedBox(
              //                 height: 50,
              //                 width: 50,
              //                 child: CircularProgressIndicator(
              //                   color: '#2A5B91'.toColor(),
              //                 ),
              //               ),
              //             ),
              //           );
              //         }

              //         final documents = snapshot.data!.docs;

              //         return ListView(
              //           children: [
              //             for (final document in documents) ...[
              //               Dismissible(
              //                 key: ValueKey(document.id),
              //                 onDismissed: (_) {
              //                   FirebaseFirestore.instance
              //                       .collection('meals')
              //                       .doc(document.id)
              //                       .delete();
              //                 },
              //                 child: CategoryWidget(
              //                   document['title'],
              //                   document['cooking_time'],
              //                   document['imageUrl'],
              //                   document['discription'],
              //                   document['ingredients'],
              //                   document['instructions'],
              //                   document['calories'],
              //                 ),
              //               ),
              //             ],
              //           ],
              //         );
            ],
          ),
        ),
      ),
    );
  }

  FirebaseStorage storage = FirebaseStorage.instance;
  Future<List<Map<String, dynamic>>> _loadImages() async {
    List<Map<String, dynamic>> files = [];

    final ListResult result = await storage.ref().list();
    final List<Reference> allFiles = result.items;

    await Future.forEach<Reference>(allFiles, (file) async {
      final String fileUrl = await file.getDownloadURL();
      final FullMetadata fileMeta = await file.getMetadata();
      files.add({
        "url": fileUrl,
        "path": file.fullPath,
        "uploaded_by": fileMeta.customMetadata?['uploaded_by'] ?? 'Nobody',
        "description":
            fileMeta.customMetadata?['description'] ?? 'No description'
      });
    });

    return files;
  }

  // Delete the selected image
  // This function is called when a trash icon is pressed
  Future<void> delete(String ref) async {
    await storage.ref(ref).delete();
    // Rebuild the UI
    setState(() {});
  }
}

class CategoryWidget extends StatelessWidget {
  const CategoryWidget(this.title, this.cookingTime, this.imageUrl,
      this.discription, this.ingredients, this.instructions, this.calories,
      {Key? key})
      : super(key: key);

  final String title;
  final String cookingTime;
  final String imageUrl;
  final String discription;
  final String ingredients;
  final String instructions;
  final String calories;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      padding: const EdgeInsets.all(30),
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          Text(title),
          Text(cookingTime),
          Text(imageUrl),
          Text(discription),
          Text(instructions),
          Text(calories),
        ],
      ),
    );
  }
}
