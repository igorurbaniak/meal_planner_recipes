import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:meal_planner_recipes/utils/extensions.dart';

class BottomNavigatorBar extends StatefulWidget {
  const BottomNavigatorBar({Key? key}) : super(key: key);

  @override
  State<BottomNavigatorBar> createState() => _BottomNavigatorBarState();
}

class _BottomNavigatorBarState extends State<BottomNavigatorBar> {
  int currentIndex = 2;
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Scaffold(
            extendBody: true,
            backgroundColor: '#f5f5f0'.toColor(),
            bottomNavigationBar: CurvedNavigationBar(
              key: _bottomNavigationKey,
              index: 2,
              height: 60.0,
              items: const <Widget>[
                Icon(Icons.add, size: 30, color: Colors.white),
                Icon(Icons.edit_calendar, size: 30, color: Colors.white),
                Icon(Icons.home, size: 40, color: Colors.white),
                Icon(Icons.add_shopping_cart, size: 30, color: Colors.white),
                Icon(Icons.person_outline, size: 30, color: Colors.white),
              ],
              color: '#a4c1c1'.toColor(),
              buttonBackgroundColor: '#537979'.toColor(),
              backgroundColor: Colors.transparent,
              animationCurve: Curves.easeInOut,
              animationDuration: const Duration(milliseconds: 600),
              onTap: (index) {
                setState(
                  () {
                    currentIndex = index;
                  },
                );
              },
              letIndexChange: (index) => true,
            ),
            body: Builder(
              builder: (context) {
                if (currentIndex == 0) {
                  return const Scaffold(
                    body: Center(
                      child: Text('Add meal page'),
                    ),
                  );
                }
                if (currentIndex == 1) {
                  return const Scaffold(
                    body: Center(
                      child: Text('Planner page'),
                    ),
                  );
                }
                if (currentIndex == 2) {
                  return const Scaffold(
                    body: Center(
                      child: Text('Home page'),
                    ),
                  );
                }
                if (currentIndex == 3) {
                  return const Scaffold(
                    body: Center(
                      child: Text('Shopping page'),
                    ),
                  );
                }
                return const Scaffold(
                  body: Center(
                    child: Text('Profile page'),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
