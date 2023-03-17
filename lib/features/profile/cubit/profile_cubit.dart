import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:meal_planner_recipes/domain/models/meals/meal_model.dart';
import 'package:meta/meta.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(const ProfileState());

  StreamSubscription? _streamSubscription;

  Future<void> start() async {
    _streamSubscription =
        FirebaseFirestore.instance.collection('meals').snapshots().listen(
      (meals) {
        final mealModels = meals.docs.map((doc) {
          return MealModel(
            id: doc.id,
            title: doc['title'],
            // cookingTime: doc['cooking_time'],
            // imageUrl: doc['imageUrl'],
            discription: doc['discription'],
            ingredients: doc['ingredients'],
            instructions: doc['instructions'],
            calories: doc['calories'],
          );
        }).toList();
        emit(ProfileState(meals: mealModels));
      },
    )..onError(
            (error) {
              emit(const ProfileState(loadingErrorOccured: true));
            },
          );
  }

  Future<void> remove({required String documentID}) async {
    try {
      await FirebaseFirestore.instance
          .collection('meals')
          .doc(documentID)
          .delete();
    } catch (error) {
      emit(
        const ProfileState(removingErrorOccured: true),
      );
    }
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }

  FirebaseStorage storage = FirebaseStorage.instance;
  Future<List<Map<String, dynamic>>> loadImages() async {
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

  Future<void> delete(String ref) async {
    await storage.ref(ref).delete();
  }
}
