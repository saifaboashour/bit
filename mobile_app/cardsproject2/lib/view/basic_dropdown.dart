import 'dart:developer';

import 'package:cardsproject2/util/text_styles.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../util/app_colors.dart';
import '../util/images_path.dart';

class BasicDropdown extends StatelessWidget {
  const BasicDropdown({
    Key? key,
    required this.label,
    required this.items,
    required this.selectedValue,
    required this.onChange,
    this.isOptional = false,
    this.isSmallHeight = false,
    this.hint = '',
    this.height = 0.05,
    this.validationMessage = '',
  }) : super(key: key);

  final String label;
  final List<String> items;
  final String? selectedValue;
  final Function(String) onChange;
  final bool isOptional;
  final bool isSmallHeight;
  final double height;
  final String hint;
  final String validationMessage;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height * height,
      width: Get.width * 0.9,
      child: DropdownButtonFormField2(
        decoration: InputDecoration(
          isDense: true,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 10.0,
            vertical: 10.0,
          ),
          errorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(5.0),
            ),
            borderSide: BorderSide(color: AppColors.redError),
          ),
          errorStyle: const TextStyle(color: AppColors.redError),
          errorText: validationMessage == "" ? null : validationMessage,
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(
                5.0,
              ),
            ),
            borderSide: BorderSide(
              color: AppColors.primaryColor,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        isExpanded: true,
        dropdownStyleData: DropdownStyleData(
          maxHeight: isSmallHeight ? Get.height * 0.18 : Get.height * 0.5,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        // value: selectedValue,
        hint: Text(
          hint == '' ? (items.isNotEmpty ? items.first : '') : hint,
          textScaleFactor: 1.0,
          style: TextStyles.bodySmall,
        ),
        buttonStyleData: ButtonStyleData(
          height: Get.height * 0.06,
          padding: const EdgeInsets.only(right: 10),
        ),
        iconStyleData: IconStyleData(
          icon: SvgPicture.asset(
            ImagePath.arrowDown,
            width: 20,
          ),
        ),
        items: items.isEmpty
            ? null
            : items
                .map((item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        textScaleFactor: 1.0,
                        style: TextStyles.bodySmall,
                      ),
                    ))
                .toList(),
        validator: (value) {
          return '';
        },
        onChanged: (value) {
          onChange(value.toString());
        },
        onSaved: (value) {
          log('onSave => $value');
        },
      ),
    );
  }
}
