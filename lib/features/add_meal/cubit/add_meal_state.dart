part of 'add_meal_cubit.dart';

class AddMealState {
  AddMealState({
    this.saved = false,
    this.errorMessage = '',
});

  final bool saved;
  final String errorMessage;
}




// class AddMealState extends Equatable {
//   final List<MealModel> meals;
//   final XFile? pickedImage;
//   final String? selectedValue;
//   final bool isLoading;

//   // In the presentation layer, we will check the value of isDone.
//   // When it is true, we will navigate to the previous page
//   final bool isDone;

//   const AddMealState({
//     this.meals = const [],
//     this.pickedImage,
//     this.selectedValue,
//     this.isLoading = false,
//     this.isDone = false,
//   });

//   @override
//   List<Object?> get props =>
//       [pickedImage?.path, selectedValue, isLoading, isDone];

//   // Helper function that updates some properties of this object,
//   // and returns a new updated instance of EditMyUserState
//   AddMealState copyWith({
//     XFile? pickedImage,
//     String? selectedValue,
//     bool? isLoading,
//     bool? isDone,
//   }) {
//     return AddMealState(
//       pickedImage: pickedImage ?? this.pickedImage,
//       selectedValue: selectedValue ?? this.selectedValue,
//       isLoading: isLoading ?? this.isLoading,
//       isDone: isDone ?? this.isDone,
//     );
//   }
// }
