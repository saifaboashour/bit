import 'dart:io';

import 'package:cardsproject2/view/text_fields/basic_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../service/files_picker/view/image_picker_dialog.dart';
import '../../../service/http_client/model/general_response.dart';
import '../../../util/app_colors.dart';
import '../../../util/common_widgets.dart';
import '../../../util/images_path.dart';
import '../../../util/text_styles.dart';
import '../home_repository.dart';
import '../model/product_input_answer.dart';
import '../model/product_input_field.dart';
import '../model/uploaded_image.dart';

class InputFieldBuilder{
  //Declarations
  final Map<int, TextEditingController> _controllerIndexMap = {};
  final Map<int, String> _errorMessageMap = {};
  final Map<int, String> _uploadedFilesPathMap = {};

  //Logic
  resetMaps(){
    _controllerIndexMap.clear();
    _errorMessageMap.clear();
    _uploadedFilesPathMap.clear();
  }

  Widget buildInputField(ProductInputField inputField){
    if(inputField.type == "Text"){
      return buildTextInputField(inputField);
    }else if(inputField.type == "Number"){
      return buildNumberInputField(inputField);
    }else if(inputField.type == "Decimal"){
      return buildDecimalInputField(inputField);
    }else if(inputField.type == "Image"){
      return buildImageInputField(inputField);
    }else if(inputField.type == "Rich Text"){
      return buildRichTextInputField(inputField);
    }
    return const SizedBox();
  }

  Widget buildTextInputField(ProductInputField inputField){
    _errorMessageMap.addIf(
      !_errorMessageMap.containsKey(inputField.id),
      inputField.id ?? -1,
      '',
    );
    _controllerIndexMap.addIf(
        !(_controllerIndexMap.containsKey(inputField.id)),
        inputField.id ?? -1,
        TextEditingController());
    return BasicTextField(
        label: inputField.name ?? '-',
        hint: inputField.name ?? '-',
        controller: _controllerIndexMap[inputField.id ?? -1] ??
            TextEditingController(),
        validator: (){},
        validationMessage: _errorMessageMap[inputField.id ?? -1],
        focusNode: null,
    );
  }

  Widget buildNumberInputField(ProductInputField inputField){
    _errorMessageMap.addIf(
      !_errorMessageMap.containsKey(inputField.id),
      inputField.id ?? -1,
      '',
    );
    _controllerIndexMap.addIf(
        !(_controllerIndexMap.containsKey(inputField.id)),
        inputField.id ?? -1,
        TextEditingController());
    return BasicTextField(
      label: inputField.name ?? '-',
      hint: inputField.name ?? '-',
      controller: _controllerIndexMap[inputField.id ?? -1] ??
          TextEditingController(),
      validator: (){
        try{
          int.parse((_controllerIndexMap[inputField.id ?? -1] ??
              TextEditingController()).text);
        }catch(e){
          _errorMessageMap[inputField.id ?? -1] = 'This Field should be a Number';
        }
      },
      keyboardType: TextInputType.number,
      validationMessage: _errorMessageMap[inputField.id ?? -1],
      focusNode: null,
    );
  }

  Widget buildDecimalInputField(ProductInputField inputField){
    _errorMessageMap.addIf(
      !_errorMessageMap.containsKey(inputField.id),
      inputField.id ?? -1,
      '',
    );
    _controllerIndexMap.addIf(
        !(_controllerIndexMap.containsKey(inputField.id)),
        inputField.id ?? -1,
        TextEditingController());
    return BasicTextField(
      label: inputField.name ?? '-',
      hint: inputField.name ?? '-',
      controller: _controllerIndexMap[inputField.id ?? -1] ??
          TextEditingController(),
      validator: (){
        try{
          double.parse((_controllerIndexMap[inputField.id ?? -1] ??
              TextEditingController()).text);
        }catch(e){
          _errorMessageMap[inputField.id ?? -1] = 'This Field should be a Decimal';
        }
      },
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      validationMessage: _errorMessageMap[inputField.id ?? -1],
      focusNode: null,
    );
  }

  Widget buildImageInputField(ProductInputField inputField){
    _uploadedFilesPathMap.addIf(
        !(_uploadedFilesPathMap.containsKey(inputField.id)),
        inputField.id ?? -1,
        '');
    return Padding(
      padding: EdgeInsets.all(Get.width * 0.02),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            inputField.name ?? '-',
            style:
            TextStyles.captionLarge.copyWith(fontWeight: FontWeight.bold),
          ),
          CommonWidgets().buildVerticalSpace(),
          InkWell(
            onTap: () {
              Get.dialog(ImagePickerDialog(action: (photo) async{
                http.MultipartFile image =
                    await http.MultipartFile.fromPath('image', photo?.path ?? '');
                GeneralResponse<UploadedImage, dynamic> response =
                    await HomeRepository().uploadOrderImage([image]);
                if(response.success){
                  _uploadedFilesPathMap[inputField.id ?? -1] = response.data?.imagePath ?? '';
                }
                Get.back();
              }));
            },
            child: Container(
              height: Get.height * 0.1,
              width: Get.width * 0.2,
              decoration: BoxDecoration(
                color: AppColors.ligthGrey,
                borderRadius: BorderRadius.circular(Get.width * 0.01),
                border: Border.all(color: AppColors.darkGrey),
              ),
              child: _uploadedFilesPathMap[inputField.id] != ''
                    ? Image.file(
                  File(
                    _uploadedFilesPathMap[inputField.id] ?? '',
                  ),
                  fit: BoxFit.fill,
                )
                    : Center(
                  child: SvgPicture.asset(
                    ImagePath.plus,
                    color: AppColors.darkGrey,
                    height: Get.height * 0.05,
                  ),
                ),

            ),
          ),
        ],
      ),
    );
  }

  Widget buildRichTextInputField(ProductInputField inputField){
    _errorMessageMap.addIf(
      !_errorMessageMap.containsKey(inputField.id),
      inputField.id ?? -1,
      '',
    );
    _controllerIndexMap.addIf(
        !(_controllerIndexMap.containsKey(inputField.id)),
        inputField.id ?? -1,
        TextEditingController());
    return BasicTextField(
      label: inputField.name ?? '-',
      hint: inputField.name ?? '-',
      controller: _controllerIndexMap[inputField.id ?? -1] ??
          TextEditingController(),
      maxLines: 6,
      validator: (){},
      validationMessage: _errorMessageMap[inputField.id ?? -1],
      focusNode: null,
    );
  }

  getAnswers(){
    List<ProductInputAnswer> fields= [];

    _controllerIndexMap.forEach((key, value) {
      fields.add(ProductInputAnswer(
        fieldId: '$key',
        answer: value.text,
      ));
    });

    _uploadedFilesPathMap.forEach((key, value)async {
      fields.add(ProductInputAnswer(
        fieldId: '$key',
        answer: value,
      ));
    });

    return fields;
  }

}
