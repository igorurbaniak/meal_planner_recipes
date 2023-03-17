part of 'profile_cubit.dart';

@immutable
class ProfileState {
  const ProfileState({
    this.meals = const [],
    this.loadingErrorOccured = false,
    this.removingErrorOccured = false,
  });

  final List<MealModel> meals;
  final bool loadingErrorOccured;
  final bool removingErrorOccured;
}
