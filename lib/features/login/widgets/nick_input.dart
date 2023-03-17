import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meal_planner_recipes/utils/extensions.dart';

class NickInput extends StatelessWidget {
  const NickInput({
    Key? key,
    required this.nickController,
  }) : super(key: key);

  final TextEditingController nickController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.grey[600]?.withOpacity(0.5),
                borderRadius: BorderRadius.circular(16)),
            child: TextField(
              keyboardType: TextInputType.name,
              controller: nickController,
              textInputAction: TextInputAction.done,
              style: const TextStyle(fontSize: 20, color: Colors.white),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Nickname',
                hintStyle: const TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 20,
                    color: Colors.white),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear, color: Colors.black),
                  onPressed: () {
                    nickController.clear();
                  },
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 18),
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(top: 8, left: 26, right: 26),
                  child: FaIcon(
                    FontAwesomeIcons.person,
                    color: '#a4c1c1'.toColor(),
                    size: 30,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
