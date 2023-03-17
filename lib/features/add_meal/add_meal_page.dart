import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meal_planner_recipes/features/add_meal/widgets/add_photo.dart';
import 'package:meal_planner_recipes/features/add_meal/widgets/calories_input.dart';
import 'package:meal_planner_recipes/features/add_meal/widgets/cooking_time_field.dart';
import 'package:meal_planner_recipes/utils/extensions.dart';

class AddMealPage extends StatefulWidget {
  AddMealPage({
    Key? key,
  }) : super(key: key);

  final titilecontroller = TextEditingController();
  final descriptioncontroller = TextEditingController();
  final ingredientscontroller = TextEditingController();
  final instructionscontroller = TextEditingController();
  final caloriescontroller = TextEditingController();

  @override
  State<AddMealPage> createState() => _AddMealPageState();
}

class _AddMealPageState extends State<AddMealPage> {
  @override
  Widget build(BuildContext context) {
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
          child: Form(
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
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  maxLength: 60,
                  style: GoogleFonts.prozaLibre(fontSize: 12),
                  controller: widget.titilecontroller,
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
                  children: const [
                    // CookingTimeField(),
                    AddPhoto(),
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
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  style: GoogleFonts.prozaLibre(fontSize: 12),
                  maxLines: 1,
                  controller: widget.descriptioncontroller,
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
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  style: GoogleFonts.prozaLibre(fontSize: 12),
                  controller: widget.ingredientscontroller,
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
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  maxLines: 3,
                  style: GoogleFonts.prozaLibre(fontSize: 12),
                  controller: widget.instructionscontroller,
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
                      // Padding(
                      //   padding: const EdgeInsets.only(left: 10, top: 10),
                      //   child: CaloriesInputField(
                      //       allowDecimal: false,
                      //       caloriescontroller: widget.caloriescontroller),
                      // ),
                      Padding(
                        padding: const EdgeInsets.only(left: 55, top: 20),
                        child: SizedBox(
                          height: 45,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: const StadiumBorder(),
                                backgroundColor: '#C47A74'.toColor()),
                            onPressed: () {
                              FirebaseFirestore.instance
                                  .collection('meals')
                                  .add({
                                'title': widget.titilecontroller.text,
                                'cooking_time': cookingTime,
                                // 'imageUrl': image,
                                'discription':
                                    widget.descriptioncontroller.text,
                                'ingredients':
                                    widget.ingredientscontroller.text,
                                'instructions':
                                    widget.instructionscontroller.text,
                                'calories': widget.caloriescontroller.text,
                              });
                              widget.titilecontroller.clear();
                              cookingTime;
                              widget.descriptioncontroller.clear();
                              widget.ingredientscontroller.clear();
                              widget.instructionscontroller.clear();
                              widget.caloriescontroller.clear();
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
      ),
    );
  }
}
