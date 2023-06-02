import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../util/app_colors.dart';
import '../../util/text_styles.dart';

class BasicDropdown extends StatelessWidget {
  const BasicDropdown({
    super.key,
    required this.hint,
    required this.items,
    required this.selectedValue,
    required this.onChange,
    this.height = 0.06,
    this.width = 1,
  });

  final String hint;
  final List<String> items;
  final String selectedValue;
  final Function(String) onChange;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return DropdownButton2(
      hint: Text(
        hint,
        style: TextStyles.bodySmall,
      ),
      items: items
          .map((item) => DropdownMenuItem<String>(
                value: item,
                child: Text(
                  item,
                  style: TextStyles.bodySmall,
                ),
              ))
          .toList(),
      value: selectedValue,
      onChanged: (value) {
        onChange(value as String);
      },
      underline: const SizedBox(),
      buttonStyleData: ButtonStyleData(
        height: Get.height * height,
        width: Get.width * width,
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(
            color: AppColors.ligthGrey,
          ),
        ),
      ),
      menuItemStyleData: MenuItemStyleData(
        height: Get.height * height,
      ),
    );
  }
}
