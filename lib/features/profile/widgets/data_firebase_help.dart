import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_planner_recipes/domain/models/meals/meal_model.dart';
import 'package:meal_planner_recipes/features/profile/cubit/profile_cubit.dart';

class UserRecipesss extends StatelessWidget {
  const UserRecipesss({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit()..start(),
      child: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          final mealModels = state.meals;
          return 
          // const Text('Dupa');
          ListView(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(
              vertical: 20,
            ),
            children: [
              for (final mealModel in mealModels)
                Dismissible(
                    key: ValueKey(mealModel.id),
                    background: const DecoratedBox(
                      decoration: BoxDecoration(
                        color: Colors.red,
                      ),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: EdgeInsets.only(right: 32.0),
                          child: Icon(
                            Icons.delete,
                          ),
                        ),
                      ),
                    ),
                    confirmDismiss: (direction) async {
                      // only from right to left
                      return direction == DismissDirection.endToStart;
                    },
                    onDismissed: (direction) {
                      context
                          .read<ProfileCubit>()
                          .remove(documentID: mealModel.id);
                    },
                    child: 
                    // Container(
                    //   color: Colors.pink,
                    // )
          _ListViewItem(
            mealModel: mealModel,
          ),
                    ),
            ],
          );
        },
      ),
    );
  }
}

class _ListViewItem extends StatelessWidget {
  const _ListViewItem({
    Key? key,
    required this.mealModel,
  }) : super(key: key);

  final MealModel mealModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigator.of(context).push(
        //   MaterialPageRoute(
        //     builder: (context) => DetailsPage(id: itemModel.id),
        //   ),
        // );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 30,
        ),
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.black12,
          ),
          child: Column(
            children: [
              // Container(
              //   height: 80,
              //   decoration: BoxDecoration(
              //     color: Colors.black12,
              //     image: DecorationImage(
              //       image: NetworkImage(
              //         itemModel.imageURL,
              //       ),
              //       fit: BoxFit.cover,
              //     ),
              //   ),
              // ),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          mealModel.title,
                          style: const TextStyle(
                            fontSize: 8.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        // Text(
                        //   mealModel.cookingTime,
                        //   style: const TextStyle(
                        //     fontSize: 8.0,
                        //     fontWeight: FontWeight.bold,
                        //   ),
                        // ),
                        const SizedBox(height: 4),
                        Text(
                          mealModel.discription,
                          style: const TextStyle(
                            fontSize: 8.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          mealModel.ingredients,
                          style: const TextStyle(
                            fontSize: 8.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          mealModel.instructions,
                          style: const TextStyle(
                            fontSize: 8.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          mealModel.calories,
                          style: const TextStyle(
                            fontSize: 8.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                      ],
                    ),
                  ),
                  // Container(
                  //   decoration: const BoxDecoration(
                  //     color: Colors.white70,
                  //   ),
                  //   margin: const EdgeInsets.all(10),
                  //   padding: const EdgeInsets.all(10),
                  //   child: Column(
                  //     children: [
                  //       Text(
                  //         itemModel.daysLeft(),
                  //         style: const TextStyle(
                  //           fontSize: 20.0,
                  //           fontWeight: FontWeight.bold,
                  //         ),
                  //       ),
                  //       const Text('days left'),
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
