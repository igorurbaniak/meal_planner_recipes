import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meal_planner_recipes/features/add_meal/cubit/add_meal_cubit.dart';
import 'package:meal_planner_recipes/features/add_meal/widgets/add_photo.dart';
import 'package:meal_planner_recipes/features/add_meal/widgets/calories_input.dart';
import 'package:meal_planner_recipes/features/add_meal/widgets/cooking_time_field.dart';
import 'package:meal_planner_recipes/features/profile/profile_page.dart';
import 'package:meal_planner_recipes/utils/extensions.dart';

class AddMealPageVol extends StatefulWidget {
  const AddMealPageVol({
    Key? key,
  }) : super(key: key);

  @override
  State<AddMealPageVol> createState() => _AddMealPageVolState();
}

class _AddMealPageVolState extends State<AddMealPageVol> {
  final titilecontroller = TextEditingController();

  final descriptioncontroller = TextEditingController();

  final ingredientscontroller = TextEditingController();

  final instructionscontroller = TextEditingController();

  final caloriescontroller = TextEditingController();

  String? _title;
  String? _cookingTime;
  // String? _imageURL;
  String? _discription;
  String? _ingredients;
  String? _instructions;
  String? _calories;

  // bool submit = false;

  // @override
  // void initState() {
  //   titilecontroller.addListener(() {
  //     submit = titilecontroller.text.isNotEmpty;
  //   });
  //   super.initState();
  // }

  // @override
  // void dispose() {
  //   titilecontroller.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddMealCubit(),
      child: BlocListener<AddMealCubit, AddMealState>(
        listener: (context, state) {
          if (state.saved) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const ProfilePage(),
              ),
            );
          }
          if (state.errorMessage.isNotEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMessage),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        child: BlocBuilder<AddMealCubit, AddMealState>(
          builder: (context, state) {
            return Scaffold(
              resizeToAvoidBottomInset: true,
              backgroundColor: '#f5f5f0'.toColor(),
              appBar: AppBar(
                backgroundColor: '#f5f5f0'.toColor(),
                elevation: 0,
                title: Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Text(
                    'Add recipe 😋',
                    style: GoogleFonts.prozaLibre(
                      fontSize: 28,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              body: SingleChildScrollView(
                primary: false,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, top: 15, right: 15),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Title',
                          style: GoogleFonts.prozaLibre(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      TextFormField(
                        onChanged: (newValue) {
                          setState(() {
                            _title = newValue;
                          });
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        maxLength: 60,
                        style: GoogleFonts.prozaLibre(fontSize: 12),
                        controller: titilecontroller,
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return 'Can\'t be empty';
                          }
                          if (text.length < 3) {
                            return 'The name is too short ';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: 'Type your recipe name here...',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8)),
                          filled: true,
                          fillColor: '#f5f5f0'.toColor(),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CookingTimeField(
                            onCookingTimeChanged: (newValue) {
                                    setState(() {
                                      _cookingTime = newValue;
                                    });
                                  },
                          ),
                          const AddPhoto(),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Discription',
                          style: GoogleFonts.prozaLibre(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      TextFormField(
                        onChanged: (newValue) {
                          setState(() {
                            _discription = newValue;
                          });
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        style: GoogleFonts.prozaLibre(fontSize: 12),
                        maxLines: 1,
                        controller: descriptioncontroller,
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return 'Can\'t be empty';
                          }
                          if (text.length < 10) {
                            return 'The discription is too short ';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText:
                              'Introduce your recipe, add notes to prepare a meal, etc...',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8)),
                          filled: true,
                          fillColor: '#f5f5f0'.toColor(),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Ingredients',
                          style: GoogleFonts.prozaLibre(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      TextFormField(
                        onChanged: (newValue) {
                          setState(() {
                            _ingredients = newValue;
                          });
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        style: GoogleFonts.prozaLibre(fontSize: 12),
                        controller: ingredientscontroller,
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return 'Can\'t be empty';
                          }
                          if (text.length < 4) {
                            return 'Add more ingredients ';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: 'Add/paste one or more ingredeints',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8)),
                          filled: true,
                          fillColor: '#f5f5f0'.toColor(),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Instructions',
                          style: GoogleFonts.prozaLibre(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      TextFormField(
                        onChanged: (newValue) {
                          setState(() {
                            _instructions = newValue;
                          });
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        maxLines: 3,
                        style: GoogleFonts.prozaLibre(fontSize: 12),
                        controller: instructionscontroller,
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return 'Can\'t be empty';
                          }
                          if (text.length < 4) {
                            return 'Add more ingredients ';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: 'Add/paste all the steps to prepare meal',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8)),
                          filled: true,
                          fillColor: '#f5f5f0'.toColor(),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Container(
                                alignment: Alignment.topCenter,
                                child: Text(
                                  'Calories',
                                  style: GoogleFonts.prozaLibre(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10, top: 10),
                              child: CaloriesInputField(
                                  onCaloriesChanged: (newValue) {
                                    setState(() {
                                      _calories = newValue;
                                    });
                                  },
                                  allowDecimal: false,
                                  caloriescontroller: caloriescontroller),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 55, top: 20),
                              child: SizedBox(
                                height: 45,
                                // child: IconButton(
                                //   icon: const Icon(Icons.add),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      shape: const StadiumBorder(),
                                      backgroundColor: '#C47A74'.toColor()),
                                  onPressed: _title == null ||
                                          // __cookingTime == null ||
                                          // _imageURL == null ||
                                          _discription == null ||
                                          _ingredients == null ||
                                          _instructions == null ||
                                          _calories == null
                                      ? null
                                      : () {
                                          context.read<AddMealCubit>().add(
                                              _title!,
                                              // _cookingTime!,
                                              // _imageURL!,
                                              _discription!,
                                              _ingredients!,
                                              _instructions!,
                                              _calories!);

                                          // FirebaseFirestore.instance
                                          //     .collection('meals')
                                          //     .add({
                                          //   'title': titilecontroller.text,
                                          //   'cooking_time': selectedValue,
                                          //   // 'imageUrl': image,
                                          //   'discription': descriptioncontroller.text,
                                          //   'ingredients': ingredientscontroller.text,
                                          //   'instructions':
                                          //       instructionscontroller.text,
                                          //   'calories': caloriescontroller.text,
                                          // });
                                          // titilecontroller.clear();
                                          // selectedValue;
                                          // descriptioncontroller.clear();
                                          // ingredientscontroller.clear();
                                          // instructionscontroller.clear();
                                          // caloriescontroller.clear();
                                        },
                                  child: Row(
                                    children: const [
                                      Icon(
                                        Icons.add,
                                        size: 22,
                                        color: Colors.white,
                                      ),
                                      SizedBox(width: 5),
                                      Text('ADD  MEAL'),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
