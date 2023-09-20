import 'package:cardsproject2/module/home/categories/categories_screen_view.dart';
import 'package:cardsproject2/module/home/products/products_screen_view.dart';
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
        AuthenticationGuard(), // Add the middleware here
      ],
      transition: Transition.noTransition,
    ),
    GetPage(
      name: Routes.categories,
      page: () => CategoriesScreen(),
      middlewares: [
        AuthenticationGuard(), // Add the middleware here
      ],
      transition: Transition.noTransition,
    ),
    GetPage(
      name: Routes.products,
      page: () => ProductsScreen(),
      middlewares: [
        AuthenticationGuard(), // Add the middleware here
      ],
      transition: Transition.noTransition,
    ),
    GetPage(
      name: Routes.productDetails,
      page: () => ProductDetailsScreen(),
      middlewares: [
        AuthenticationGuard(), // Add the middleware here
      ],
      transition: Transition.noTransition,
    ),
  ];
}
