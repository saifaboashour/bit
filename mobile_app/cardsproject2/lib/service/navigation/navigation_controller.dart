import 'package:cardsproject2/module/home/categories/categories_screen_view.dart';
import 'package:cardsproject2/module/home/products/products_screen_view.dart';
import 'package:cardsproject2/module/notifications/details/notification_details_screen_view.dart';
import 'package:cardsproject2/module/notifications/notifications_screen_view.dart';
import 'package:cardsproject2/module/settings/account_settings/change_password_screen_view.dart';
import 'package:cardsproject2/module/settings/account_settings/edit_profile_screen_view.dart';
import 'package:cardsproject2/module/settings/app_settings/language/change_language_screen_view.dart';
import 'package:cardsproject2/module/settings/app_settings/printers/manage_printers_screen_view.dart';
import 'package:cardsproject2/module/settings/credit_settings/change_currency/change_currency_screen_view.dart';
import 'package:cardsproject2/module/settings/credit_settings/credit_history/credit_request_history_screen_view.dart';
import 'package:cardsproject2/module/settings/credit_settings/credit_request/credit_request_screen_view.dart';
import 'package:cardsproject2/module/settings/credit_settings/credit_request/request_credit_bank_transfer_screen_view.dart';
import 'package:cardsproject2/module/settings/credit_settings/credit_request/request_credit_prepaid_screen_view.dart';
import 'package:cardsproject2/module/settings/credit_settings/credit_request/request_credit_qr_code_screen_view.dart';
import 'package:cardsproject2/module/settings/help/privacy_policy_screen_view.dart';
import 'package:cardsproject2/module/settings/help/support_screen_view.dart';
import 'package:cardsproject2/module/settings/help/terms_and_conditions_screen_view.dart';
import 'package:cardsproject2/module/settings/settings_screen_view.dart';
import 'package:get/get.dart';
import '../../module/authentication/forget_password/forget_password_screen_view.dart';
import '../../module/authentication/login/login_screen_view.dart';
import '../../module/authentication/one_time_password/one_time_password_screen_view.dart';
import '../../module/authentication/register/register_screen_view.dart';
import '../../module/home/products_details/product_details_screen_view.dart';
import '../../module/main_container/main_container_view.dart';
import '../../module/onboarding/splash/splash_screen_view.dart';
import 'middlewares/authentication_middleware.dart';
import 'routes.dart';

class NavigationController {
  static final appPages = [
    //Root
    GetPage(
      name: Routes.splash,
      page: () => SplashScreen(),
    ),
    //Authentication
    GetPage(
      name: Routes.login,
      page: () => LoginScreen(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: Routes.register,
      page: () => RegisterScreen(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: Routes.forgetPassword,
      page: () => ForgetPasswordScreen(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: Routes.oneTimePassword,
      page: () => OneTimePasswordScreen(),
      transition: Transition.noTransition,
    ),
    //Home
    GetPage(
      name: Routes.home,
      page: () => MainContainerScreen(),
      middlewares: [
        AuthenticationGuard(),
      ],
      transition: Transition.noTransition,
    ),
    GetPage(
      name: Routes.categories,
      page: () => CategoriesScreen(),
      middlewares: [
        AuthenticationGuard(),
      ],
      transition: Transition.noTransition,
    ),
    GetPage(
      name: Routes.products,
      page: () => ProductsScreen(),
      middlewares: [
        AuthenticationGuard(),
      ],
      transition: Transition.noTransition,
    ),
    GetPage(
      name: Routes.productDetails,
      page: () => ProductDetailsScreen(),
      middlewares: [
        AuthenticationGuard(),
      ],
      transition: Transition.noTransition,
    ),
    //Notifications
    GetPage(
      name: Routes.notifications,
      page: () => NotificationsScreen(),
      middlewares: [
        AuthenticationGuard(),
      ],
      transition: Transition.noTransition,
    ),
    GetPage(
      name: Routes.notificationDetails,
      page: () => NotificationDetailsScreen(),
      middlewares: [
        AuthenticationGuard(),
      ],
      transition: Transition.noTransition,
    ),
    //Settings
    GetPage(
      name: Routes.settings,
      page: () => SettingsScreen(),
      middlewares: [
        AuthenticationGuard(),
      ],
      transition: Transition.noTransition,
    ),
    //Account Settings
  GetPage(
  name: Routes.editProfile,
  page: () => EditProfileScreen(),
  middlewares: [
  AuthenticationGuard(),
  ],
  transition: Transition.noTransition,
  ),
  GetPage(
  name: Routes.changePassword,
  page: () => ChangePasswordScreen(),
  middlewares: [
  AuthenticationGuard(),
  ],
  transition: Transition.noTransition,
  ),

    //Credit Settings
  GetPage(
  name: Routes.requestCredit,
  page: () => RequestCreditScreen(),
  middlewares: [
  AuthenticationGuard(),
  ],
  transition: Transition.noTransition,
  ),
  GetPage(
  name: Routes.creditHistory,
  page: () => CreditRequestHistoryScreen(),
  middlewares: [
  AuthenticationGuard(),
  ],
  transition: Transition.noTransition,
  ),
  GetPage(
  name: Routes.changeCurrency,
  page: () => ChangeCurrencyScreen(),
  middlewares: [
  AuthenticationGuard(),
  ],
  transition: Transition.noTransition,
  ),
  GetPage(
  name: Routes.requestCreditBankTransfer,
  page: () => RequestCreditBankTransferScreen(),
  middlewares: [
  AuthenticationGuard(),
  ],
  transition: Transition.noTransition,
  ),
  GetPage(
  name: Routes.requestCreditPrepaid,
  page: () => RequestCreditPrepaidScreen(),
  middlewares: [
  AuthenticationGuard(),
  ],
  transition: Transition.noTransition,
  ),
  // GetPage(
  // name: Routes.requestCreditQRCode,
  // page: () => RequestCreditQRCodeScreen(),
  // middlewares: [
  // AuthenticationGuard(),
  // ],
  // transition: Transition.noTransition,
  // ),
  // GetPage(
  // name: Routes.sendCredit,
  // page: () => ChangePasswordScreen(),
  // middlewares: [
  // AuthenticationGuard(),
  // ],
  // transition: Transition.noTransition,
  // ),
    //App Settings
  GetPage(
  name: Routes.changeLanguage,
  page: () => const ChangeLanguageScreen(),
  middlewares: [
  AuthenticationGuard(),
  ],
  transition: Transition.noTransition,
  ),
  GetPage(
  name: Routes.managePrinters,
  page: () => ManagePrintersScreen(),
  middlewares: [
  AuthenticationGuard(),
  ],
  transition: Transition.noTransition,
  ),
    //Help Settings
  GetPage(
  name: Routes.support,
  page: () => SupportScreen(),
  middlewares: [
  AuthenticationGuard(),
  ],
  transition: Transition.noTransition,
  ),
  GetPage(
  name: Routes.privacyPolicy,
  page: () => PrivacyPolicyScreen(),
  middlewares: [
  AuthenticationGuard(),
  ],
  transition: Transition.noTransition,
  ),
  GetPage(
  name: Routes.termsAndConditions,
  page: () => TermsAndConditionsScreen(),
  middlewares: [
  AuthenticationGuard(),
  ],
  transition: Transition.noTransition,
  ),
  ];
}
