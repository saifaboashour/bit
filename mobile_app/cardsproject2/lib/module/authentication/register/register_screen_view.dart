import 'package:cardsproject2/view/basic_dropdown.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../util/app_colors.dart';
import '../../../util/common_widgets.dart';
import '../../../util/text_styles.dart';
import '../../../view/buttons/primary_button.dart';
import '../../../view/text_fields/basic_textfield.dart';
import '../login/login_screen_view.dart';
import '../model/countries_response.dart';
import 'register_controller.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);

  final RegisterController _registerController = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: Get.width * 0.02),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonWidgets().buildVerticalSpace(space: 0.02),
                buildTitleAndSubTitle(),
                const Spacer(),
                buildRegisterationProgress(),
                const Spacer(),
                Obx(
                  () => _registerController.registerationProgress == 1
                      ? buildRegisterFormStepOne()
                      : buildRegisterFormStepTwo(),
                ),
                const Spacer(),
                buildButton(),
                CommonWidgets().buildVerticalSpace(space: 0.02),
                buildSwitchToLogin(),
                CommonWidgets().buildVerticalSpace(space: 0.05),
              ],
            )),
      ),
    );
  }

  buildTitleAndSubTitle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Welcome to Bitaqty",
          style: TextStyles.heading1.copyWith(
            color: AppColors.darkGrey,
          ),
        ),
        Row(
          children: [
            CommonWidgets().buildHorizontalSpace(space: 0.02),
            Text(
              "Start Shopping Now...",
              style: TextStyles.bodySmall.copyWith(
                color: AppColors.darkGrey,
              ),
            ),
          ],
        ),
      ],
    );
  }

  buildRegisterationProgress() {
    return Obx(
      () => Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _registerController.registerationProgress == 2
              ? InkWell(
                  onTap: () {
                    _registerController.changeRegisterationProgress(1);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Back',
                      style: TextStyles.bodySmall.copyWith(
                        color: AppColors.darkGrey,
                      ),
                    ),
                  ),
                )
              : const SizedBox(),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Step ${_registerController.registerationProgress}',
                style: TextStyles.bodySmall.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              CommonWidgets().buildVerticalSpace(space: 0.01),
              SizedBox(
                width: Get.width * 0.5,
                child: LinearProgressIndicator(
                  value: (_registerController.registerationProgress) / 2,
                  color: AppColors.primaryColor,
                  backgroundColor: AppColors.ligthGrey.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ],
          ),
          const Spacer(),
        ],
      ),
    );
  }

  buildRegisterFormStepOne() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Obx(
            () => BasicTextField(
              label: 'Full Name',
              hint: 'Full Name',
              width: 0.9,
              controller: _registerController.fullNameTextFieldController,
              validator: () {},
              validationMessage: _registerController.fullNameErrorMessage,
              focusNode: null,
            ),
          ),
        ),
        CommonWidgets().buildVerticalSpace(),
        Center(
          child: Obx(
            () => BasicTextField(
              label: 'Email',
              hint: 'Email',
              width: 0.9,
              controller: _registerController.emailTextFieldController,
              validator: () {},
              validationMessage: _registerController.emailErrorMessage,
              focusNode: null,
            ),
          ),
        ),
        CommonWidgets().buildVerticalSpace(),
        Center(
          child: Obx(
            () => BasicTextField(
              label: 'Phone Number',
              hint: 'Phone Number',
              width: 0.9,
              controller: _registerController.phoneNumberTextFieldController,
              validator: () {},
              validationMessage: _registerController.phoneNumberErrorMessage,
              focusNode: null,
            ),
          ),
        ),
        CommonWidgets().buildVerticalSpace(),
        Center(
          child: Obx(
            () => BasicTextField(
              label: 'Password',
              hint: 'Password',
              width: 0.9,
              controller: _registerController.passwordTextFieldController,
              validator: () {},
              validationMessage: _registerController.passwordErrorMessage,
              focusNode: null,
            ),
          ),
        ),
        CommonWidgets().buildVerticalSpace(),
        Center(
          child: Obx(
            () => BasicTextField(
              label: 'Confirm Pasword',
              hint: 'Confirm Pasword',
              width: 0.9,
              controller:
                  _registerController.confirmPasswordTextFieldController,
              validator: () {},
              validationMessage:
                  _registerController.confirmPasswordErrorMessage,
              focusNode: null,
            ),
          ),
        ),
      ],
    );
  }

  buildRegisterFormStepTwo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Obx(
            () => BasicTextField(
              label: 'Commercial Name',
              hint: 'Commercial Name',
              width: 0.9,
              controller: _registerController.commercialNameTextFieldController,
              validator: () {},
              validationMessage: _registerController.commercialNameErrorMessage,
              focusNode: null,
            ),
          ),
        ),
        CommonWidgets().buildVerticalSpace(),
        Center(
          child: Obx(
            () => BasicTextField(
              label: 'Address',
              hint: 'Address',
              width: 0.9,
              controller: _registerController.addressTextFieldController,
              validator: () {},
              validationMessage: _registerController.addressErrorMessage,
              focusNode: null,
            ),
          ),
        ),
        CommonWidgets().buildVerticalSpace(),
        Center(
          child: Obx(
            () => BasicDropdown(
              label: 'Country',
              items: _registerController.countryList.isNotEmpty
                  ? _registerController.countryList
                      .map((country) => country.name ?? 'Loading...')
                      .toList()
                  : [],
              selectedValue: _registerController.selectedCountryValue,
              height: 0.06,
              onChange: (value) => _registerController.selectCountry(value),
            ),
          ),
        ),
        CommonWidgets().buildVerticalSpace(),
        Center(
          child: Obx(
            () => BasicDropdown(
              label: 'State',
              hint: 'Select State',
              items: _registerController.countryList.isNotEmpty
                  ? _registerController.countryList
                          .firstWhere(
                            (element) =>
                                element.name ==
                                _registerController.selectedCountryValue,
                            orElse: () => CountryResponse(states: []),
                          )
                          .states
                          ?.map((state) => state.name ?? 'Loading...')
                          .toList() ??
                      []
                  : [],
              selectedValue: _registerController.selectedStateValue,
              height: 0.06,
              onChange: (value) => _registerController.selectState(value),
            ),
          ),
        ),
        CommonWidgets().buildVerticalSpace(),
        Center(
          child: Obx(
            () => BasicDropdown(
              label: 'Currency',
              hint: 'Select Currency',
              items: _registerController.countryList.isNotEmpty
                  ? _registerController.countryList
                          .firstWhere(
                            (element) =>
                                element.name ==
                                _registerController.selectedCountryValue,
                            orElse: () => CountryResponse(),
                          )
                          .currencies
                          ?.map((currency) => currency.name ?? 'Loading...')
                          .toList() ??
                      []
                  : [],
              selectedValue: _registerController.selectedCurrencyValue,
              height: 0.06,
              onChange: (value) => _registerController.selectCurrency(value),
            ),
          ),
        ),
      ],
    );
  }

  buildButton() {
    return Obx(
      () => _registerController.registerationProgress == 1
          ? Center(
              child: PrimaryButton(
                label: 'Next',
                width: 0.9,
                action: () {
                  _registerController.changeRegisterationProgress(2);
                },
              ),
            )
          : Center(
              child: PrimaryButton(
                label: 'Register',
                width: 0.9,
                action: () {
                  _registerController.register();
                },
              ),
            ),
    );
  }

  buildSwitchToLogin() {
    return Center(
      child: RichText(
        text: TextSpan(
          text: 'Already have account? ',
          style: TextStyles.bodySmall.copyWith(color: AppColors.darkGrey),
          children: <TextSpan>[
            TextSpan(
              text: 'Login Now',
              style: TextStyles.bodySmall.copyWith(
                color: AppColors.primaryColor,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Get.offAll(
                    () => LoginScreen(),
                    transition: Transition.noTransition,
                  );
                },
            ),
          ],
        ),
      ),
    );
  }
}
