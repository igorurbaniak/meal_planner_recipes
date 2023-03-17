import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meal_planner_recipes/utils/extensions.dart';

class CaloriesInputField extends StatefulWidget {
  const CaloriesInputField({
    super.key,
    this.value,
    this.label,
    this.error,
    this.icon,
    required this.allowDecimal,
    required this.caloriescontroller, required this.onCaloriesChanged,
  });

  final String? value;
  final String? label;
  final String? error;
  final Widget? icon;
  final bool allowDecimal;
  final TextEditingController caloriescontroller;
  final Function(String) onCaloriesChanged;

  @override
  State<CaloriesInputField> createState() => _CaloriesInputFieldState();
}

class _CaloriesInputFieldState extends State<CaloriesInputField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 4, bottom: 8, right: 6),
      height: 60,
      width: 100,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: TextFormField(
          textAlignVertical: TextAlignVertical.center,
          maxLength: 5,
          controller: widget.caloriescontroller,
          initialValue: widget.value,
          onChanged: widget.onCaloriesChanged,
          readOnly: false,
          keyboardType:
              TextInputType.numberWithOptions(decimal: widget.allowDecimal),
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.allow(RegExp(_getRegexString())),
            TextInputFormatter.withFunction(
              (oldValue, newValue) => newValue.copyWith(
                text: newValue.text.replaceAll('.', ','),
              ),
            ),
          ],
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            filled: true,
            fillColor: '#f5f5f0'.toColor(),
            hintText: widget.label,
            errorText: widget.error,
            icon: widget.icon,
          ),
        ),
      ),
    );
  }

  String _getRegexString() =>
      widget.allowDecimal ? r'[0-9]+[,.]{0,1}[0-9]*' : r'[0-9]';
}
