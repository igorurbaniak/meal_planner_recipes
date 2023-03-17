import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meal_planner_recipes/utils/extensions.dart';

class TextInput extends StatelessWidget {
  const TextInput({
    Key? key,
    required this.emailController,
  }) : super(key: key);

  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[600]?.withOpacity(0.5),
              borderRadius: BorderRadius.circular(16),
            ),
            child: TextFormField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              style: const TextStyle(fontSize: 20, color: Colors.white),
              onChanged: (email) {},
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Email',
                hintStyle: const TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 20,
                    color: Colors.white),
                suffixIcon: IconButton(
                  icon: const Icon(
                    Icons.clear,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    emailController.clear();
                  },
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 18),
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(top: 8, left: 20, right: 20),
                  child: FaIcon(
                    FontAwesomeIcons.solidEnvelope,
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
