import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../util/app_colors.dart';
import '../util/text_styles.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.label,
    required this.hint,
    required this.controller,
    required this.validator,
    required this.validationMessage,
    // this.maskFormatter,
    this.keyboardType,
    this.maxLines = 1,
    this.isActive = true,
    this.width = 1,
    this.isOptional = false,
    required this.focusNode,
  }) : super(key: key);

  final String label;
  final String hint;
  final TextEditingController controller;
  final Function validator;
  final String? validationMessage;
  // final TypeInputFormatter? maskFormatter;
  final TextInputType? keyboardType;
  final FocusNode? focusNode;
  final bool isActive;
  final int? maxLines;
  final double width;
  final bool isOptional;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Flexible(
              child: Text(
                label.toUpperCase(),
                textScaleFactor: 1.0,
                maxLines: 3,
                style: TextStyles.bodyLarge,
              ),
            ),
            isOptional
                ? const SizedBox()
                : Text(
                    "*",
                    textScaleFactor: 1.0,
                    style: TextStyles.bodyLarge.copyWith(
                      color: Colors.red,
                      fontSize: TextStyles.bodyLarge.fontSize! + 7,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
          ],
        ),
        SizedBox(
          height: Get.height * 0.006,
        ),
        SizedBox(
          width: Get.width * width,
          child: TextField(
            enabled: isActive,
            keyboardType: keyboardType,
            controller: controller,
            focusNode: focusNode,
            maxLines: maxLines,
            // inputFormatters: maskFormatter != null ? [maskFormatter]:[],
            onChanged: (value) {
              validator.call();
            },
            style: TextStyles.bodyLarge,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 10.0,
                vertical: 10.0,
              ),
              hintText: hint,
              errorBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    10.0,
                  ),
                ),
                borderSide: BorderSide(
                  color: Colors.red,
                ),
              ),
              errorStyle: const TextStyle(
                color: Colors.red,
              ),
              errorText: validationMessage == "" ||
                      (validationMessage == "" && controller.text == "")
                  ? null
                  : validationMessage,
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    10.0,
                  ),
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    10.0,
                  ),
                ),
                borderSide: BorderSide(
                  color: AppColors.primaryColor,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
