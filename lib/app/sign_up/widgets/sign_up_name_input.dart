import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meal_planner_recipes/app/sign_up/cubit/sign_up_cubit.dart';
import 'package:meal_planner_recipes/utils/extensions.dart';

class NickInputField extends StatelessWidget {
  const NickInputField({
    Key? key,
    required this.nickController,
    required this.state,
  }) : super(key: key);

  final TextEditingController nickController;
  final SignUpState state;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 62,
                decoration: BoxDecoration(
                    color: Colors.grey[600]?.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(16)),
              ),
              TextField(
                keyboardType: TextInputType.name,
                controller: nickController,
                textInputAction: TextInputAction.done,
                style: const TextStyle(fontSize: 20, color: Colors.white),
                onChanged: (name) =>
                    context.read<SignUpCubit>().nameChanged(name),
                decoration: InputDecoration(
                  errorStyle: const TextStyle(fontSize: 13, letterSpacing: 0.3),
                  errorText: state.name.error?.name,
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
                    padding: const EdgeInsets.only(top: 8, left: 20, right: 20),
                    child: FaIcon(
                      FontAwesomeIcons.person,
                      color: '#a4c1c1'.toColor(),
                      size: 30,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
