import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meal_planner_recipes/domain/models/meals/meal_model.dart';

class MealsRepository {
  Stream<List<MealModel>> getMealsStream() {
    return FirebaseFirestore.instance.collection('meals').snapshots().map(
      (querySnapshot) {
        return querySnapshot.docs.map(
          (doc) {
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
          },
        ).toList();
      },
    );
  }
}
