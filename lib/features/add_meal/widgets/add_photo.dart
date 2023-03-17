import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meal_planner_recipes/utils/extensions.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart' as path;

class AddPhoto extends StatefulWidget {
  const AddPhoto({super.key});

  @override
  State<AddPhoto> createState() => _AddPhotoState();
}

class _AddPhotoState extends State<AddPhoto> {
  XFile? pickedImage;

  @override
  Widget build(BuildContext context) {
    FirebaseStorage storage = FirebaseStorage.instance;

    Future<void> upload(String inputSource) async {
      final picker = ImagePicker();

        try {
          pickedImage = await picker.pickImage(
              source: inputSource == 'camera'
                  ? ImageSource.camera
                  : ImageSource.gallery,
              maxWidth: 1920);

          final String fileName = path.basename(pickedImage!.path);
          File imageFile = File(pickedImage!.path);
          setState(() => pickedImage = XFile(pickedImage!.path));

          try {
            await storage.ref(fileName).putFile(
                  imageFile,
                  SettableMetadata(
                    customMetadata: {
                      'uploaded_by': 'A bad guy',
                      'description': 'Some description...'
                    },
                  ),
                );

            setState(
              () {
                pickedImage = XFile(pickedImage!.path);
              },
            );
          } on FirebaseException catch (error) {
            if (kDebugMode) {
              print(error);
            }
          }
        } catch (err) {
          if (kDebugMode) {
            print(err);
          }
        }
      }


    return Padding(
      padding: const EdgeInsets.only(right: 50),
      child: DottedBorder(
        dashPattern: const [6],
        color: '#537979'.toColor(),
        borderType: BorderType.RRect,
        radius: const Radius.circular(12),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          child: InkWell(
            onTap: () {
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
                      onTap: () => Navigator.of(context).pop(
                        upload('gallery'),
                        // pickImage(),
                      ),
                    ),
                    ListTile(
                      leading: const Icon(Icons.camera_alt),
                      title: const Text('Camera'),
                      onTap: () => Navigator.of(context).pop(
                        upload('camera'),
                        // pickImageCamera(),
                      ),
                    ),
                  ],
                ),
              );
            },
            child: Container(
              height: 120,
              width: 120,
              color: Colors.transparent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  pickedImage != null
                      ? Image.file(
                          File(pickedImage!.path),
                          fit: BoxFit.cover,
                          height: 120,
                          width: 120,
                        )
                      : Column(
                          children: [
                            Icon(
                              Icons.camera_enhance_rounded,
                              color: '#a4c1c1'.toColor(),
                              size: 40,
                            ),
                            const SizedBox(height: 10),
                            Text(
                              "Add Cover Photo",
                              style: GoogleFonts.prozaLibre(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: '#a4c1c1'.toColor()),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
