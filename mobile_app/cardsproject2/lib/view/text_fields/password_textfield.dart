import 'package:cardsproject2/util/images_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../util/app_colors.dart';
import '../../util/text_styles.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({
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

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool isHidden = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width * widget.width,
      child: TextField(
        enabled: widget.isActive,
        keyboardType: widget.keyboardType,
        controller: widget.controller,
        focusNode: widget.focusNode,
        maxLines: widget.maxLines,
        obscureText: isHidden,
        // inputFormatters: maskFormatter != null ? [maskFormatter]:[],
        onChanged: (value) {
          widget.validator.call();
        },
        style: TextStyles.bodySmall,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 10.0,
            vertical: 10.0,
          ),
          hintText: widget.hint,
          suffixIcon: Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                setState(() {
                  isHidden = !isHidden;
                });
              },
              child: SvgPicture.asset(
                isHidden ? ImagePath.eye : ImagePath.eyeOff,
                height: 8.0,
              ),
            ),
          ),
          errorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(
                8.0,
              ),
            ),
            borderSide: BorderSide(
              color: Colors.red,
            ),
          ),
          errorStyle: const TextStyle(
            color: Colors.red,
          ),
          errorText: widget.validationMessage == "" ||
                  (widget.validationMessage == "" &&
                      widget.controller.text == "")
              ? null
              : widget.validationMessage,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(
                8.0,
              ),
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(
                8.0,
              ),
            ),
            borderSide: BorderSide(
              color: AppColors.primaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
