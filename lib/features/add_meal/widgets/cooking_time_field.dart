import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meal_planner_recipes/utils/extensions.dart';

class CookingTimeField extends StatefulWidget {
  const CookingTimeField({
    super.key,
    required this.onCookingTimeChanged,
  });

  final Function(String) onCookingTimeChanged;

  @override
  State<CookingTimeField> createState() => _CookingTimeFieldState();
}

final List<String> items = [
  'none',
  '15 min',
  '30 min',
  '45 min',
  '60 min',
  '75 min',
  '90 min',
  '105 min',
  '120 min',
  '150 min',
  '> 150 min',
];

String? cookingTime;

class _CookingTimeFieldState extends State<CookingTimeField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 120,
          padding: const EdgeInsets.only(right: 10),
          child: Text(
            'Cooking time',
            style: GoogleFonts.prozaLibre(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
        ),
        const SizedBox(height: 5),
        DropdownButtonHideUnderline(
          child: DropdownButton2(
            itemPadding: const EdgeInsets.only(left: 8, right: 8),
            dropdownDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
            ),
            scrollbarRadius: const Radius.circular(12),
            scrollbarThickness: 5,
            scrollbarAlwaysShow: true,
            buttonDecoration: BoxDecoration(
                color: '#E1EAED'.toColor(),
                borderRadius: BorderRadius.circular(12)),
            dropdownPadding: const EdgeInsets.only(left: 10, right: 10),
            buttonPadding: const EdgeInsets.all(8),
            icon: const Icon(
              Icons.arrow_downward_outlined,
              color: Colors.black,
              size: 18,
            ),
            isExpanded: true,
            hint: Text(
              'Select time',
              style: GoogleFonts.prozaLibre(
                fontSize: 14,
                color: Colors.black,
              ),
            ),
            items: _addDividersAfterItems(items),
            customItemsHeights: _getCustomItemsHeights(),
            value: cookingTime,
            onChanged: (value) {
              cookingTime = value;
              widget.onCookingTimeChanged;
            },
            buttonHeight: 40,
            dropdownMaxHeight: 160,
            buttonWidth: 120,
          ),
        ),
      ],
    );
  }

  List<DropdownMenuItem<String>> _addDividersAfterItems(List<String> items) {
    List<DropdownMenuItem<String>> menuItems = [];
    for (var item in items) {
      menuItems.addAll(
        [
          DropdownMenuItem<String>(
            value: item,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                item,
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
            ),
          ),
          if (item != items.last)
            const DropdownMenuItem<String>(
              enabled: false,
              child: Divider(),
            ),
        ],
      );
    }
    return menuItems;
  }

  List<double> _getCustomItemsHeights() {
    List<double> itemsHeights = [];
    for (var i = 0; i < (items.length * 2) - 1; i++) {
      if (i.isEven) {
        itemsHeights.add(40);
      }
      //Dividers indexes will be the odd indexes
      if (i.isOdd) {
        itemsHeights.add(4);
      }
    }
    return itemsHeights;
  }
}
