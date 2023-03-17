import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meal_planner_recipes/utils/extensions.dart';

class RecipesAndFavourites extends StatefulWidget {
  const RecipesAndFavourites({super.key});

  final String textLeft = 'Recipes';
  final String textRight = 'Favourites';

  @override
  State<RecipesAndFavourites> createState() => _RecipesAndFavouritesState();
}

class _RecipesAndFavouritesState extends State<RecipesAndFavourites> {
  bool leftright = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        color: '#f5f5f0'.toColor(),
        height: 50,
        child: Row(
          children: [
            Expanded(
              child: InkWell(
                onTap: () {
                  setState(
                    () {
                      leftright = false;
                    },
                  );
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      widget.textLeft,
                      style: GoogleFonts.prozaLibre(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: leftright == false
                            ? '#2A5B91'.toColor()
                            : Colors.grey,
                      ),
                    ),
                    Container(
                      height: leftright == false ? 3 : 1,
                      color: leftright == false
                          ? '#2A5B91'.toColor()
                          : Colors.grey,
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: () {
                  setState(
                    () {
                      leftright = true;
                    },
                  );
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      widget.textRight,
                      style: GoogleFonts.prozaLibre(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: leftright == true
                            ? '#C47A74'.toColor()
                            : Colors.grey,
                      ),
                    ),
                    Container(
                      height: leftright == true ? 3 : 1,
                      color:
                          leftright == true ? '#C47A74'.toColor() : Colors.grey,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}