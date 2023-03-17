import 'package:equatable/equatable.dart';

class MealModel
// extends Equatable
{
  const MealModel({
    required this.id,
    required this.title,
    // required this.cookingTime,
    // required this.imageUrl,
    required this.discription,
    required this.ingredients,
    required this.instructions,
    required this.calories,
  });

  final String id;
  final String title;
  // final String cookingTime;
  // final String imageUrl;
  final String discription;
  final String ingredients;
  final String instructions;
  final String calories;

//   @override
//   List<Object?> get props => [
//         title,
//         selectedValue,
//         image,
//         discription,
//         ingredients,
//         instructions,
//         calories
//       ];

//   Map<String, Object?> toFirebaseMap() {
//     return <String, Object?>{
//       'title': title,
//       'cooking_time': selectedValue,
//       'image': image,
//       'discription': discription,
//       'ingredients': ingredients,
//       'instructions': instructions,
//       'calories': calories,
//     };
//   }

//   MealModel copyWith({
//     String? title,
//     String? selectedValue,
//     String? image,
//     String? discription,
//     String? ingredients,
//     String? instructions,
//     String? calories,
//   }) {
//     return MealModel(
//       title: title ?? this.title,
//       selectedValue: selectedValue ?? this.selectedValue,
//       discription: discription ?? this.discription,
//       ingredients: ingredients ?? this.ingredients,
//       instructions: instructions ?? this.instructions,
//       calories: calories ?? this.calories,
//     );
//   }
}
