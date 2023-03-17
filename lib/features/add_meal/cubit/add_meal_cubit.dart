import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
part 'add_meal_state.dart';

class AddMealCubit extends Cubit<AddMealState> {
  AddMealCubit() : super(AddMealState());

  Future<void> add(
    String title,
    // String? cookingTime,
    // String? imageURL,
    String discription,
    String ingredients,
    String instructions,
    String calories,
  ) async {
    try {
      await FirebaseFirestore.instance.collection('meals').add({
        'title': title,
        // 'cooking_time': cookingTime,
        // 'imageUrl': imageURL,
        'discription': discription,
        'ingredients': ingredients,
        'instructions': instructions,
        'calories': calories,
      });
      emit(
        AddMealState(
          saved: true,
        ),
      );
    } catch (error) {
      emit(
        AddMealState(
          errorMessage: error.toString(),
        ),
      );
    }
  }
}





























  // void setImage(XFile? imageFile) async {
  //   emit(state.copyWith(pickedImage: imageFile));
  // }

  // This function will be called from the presentation layer
  // when the user has to be saved
  // Future<void> saveMyUser(
  //   String title,
  //   String discription,
  //   String ingredients,
  //   String instructions,
  //   String calories,

    
  // ) async {
  //   emit(state.copyWith(isLoading: true));

    // If we are editing, we use the existing id. Otherwise, create a new one.
    // final uid = _toEdit?.id ?? _userRepository.newId();
    // _toEdit = MyUser(
    //     id: uid,
    //     name: name,
    //     lastName: lastName,
    //     age: age,
    //     image: _toEdit?.image);

  //   await _userRepository.saveMyUser(_toEdit!, state.pickedImage);
  //   emit(state.copyWith(isDone: true));
  // }

  // This function will be called from the presentation layer
  // when we want to delete the user
//   Future<void> deleteMyUser() async {
//     emit(state.copyWith(isLoading: true));
//     if (_toEdit != null) {
//       await _userRepository.deleteMyUser(_toEdit!);
//     }
//     emit(state.copyWith(isDone: true));
//   }
// }

  // StreamSubscription? _streamSubscription;

  // Future<void> start() async {
    // _streamSubscription = FirebaseFirestore.instance.collection('meals').add({
    //   'title': titilecontroller.text,
    //   'cooking_time': selectedValue,
    //   // 'imageUrl': image,
    //   'discription': descriptioncontroller.text,
    //   'ingredients': ingredientscontroller.text,
    //   'instructions': instructionscontroller.text,
    //   'calories': caloriescontroller.text,
    // });
  // }

