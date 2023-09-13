import 'package:get/get.dart';
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
    // //Authentication
    // GetPage(
    //   name: Routes.login,
    //   page: () => LoginScreen(
    //     invitedUser: Get.arguments,
    //   ),
    //   transition: Transition.noTransition,
    // ),
    // GetPage(
    //   name: Routes.register,
    //   page: () => RegisterScreen(),
    //   transition: Transition.noTransition,
    // ),
    // GetPage(
    //   name: Routes.forgetPassword,
    //   page: () => ForgetPasswordScreen(),
    //   transition: Transition.noTransition,
    // ),
    // GetPage(
    //   name: Routes.resetPasswordValidator,
    //   page: () => ResetPasswordValidatingTokenScreen(),
    //   transition: Transition.noTransition,
    // ),
    // GetPage(
    //   name: Routes.resetPassword,
    //   page: () => ResetPasswordScreen(),
    //   transition: Transition.noTransition,
    // ),
    // GetPage(
    //   name: Routes.invitation,
    //   page: () => ValidatingTokenScreen(),
    //   transition: Transition.noTransition,
    // ),
    // //Home
    // GetPage(
    //   name: Routes.home,
    //   page: () => BaseScreenContainer(),
    //   middlewares: [
    //     AuthenticationGuard(), // Add the middleware here
    //   ],
    //   transition: Transition.noTransition,
    // ),
    // //Profile
    // GetPage(
    //   name: Routes.profile,
    //   page: () => EditProfileScreen(),
    //   middlewares: [
    //     AuthenticationGuard(), // Add the middleware here
    //   ],
    //   transition: Transition.noTransition,
    // ),
    // //CDL
    // GetPage(
    //   name: Routes.profileCdl,
    //   page: () => CommercialDriverLicenseScreen(),
    //   middlewares: [
    //     AuthenticationGuard(), // Add the middleware here
    //   ],
    //   transition: Transition.noTransition,
    // ),
    // GetPage(
    //   name: Routes.profileCdlAddEdit,
    //   page: () => AddCommercialDriverLicenesScreen(),
    //   middlewares: [
    //     AuthenticationGuard(), // Add the middleware here
    //   ],
    //   transition: Transition.noTransition,
    // ),
    // //Emplyment
    // GetPage(
    //   name: Routes.profileEmployment,
    //   page: () => EmploymentScreen(),
    //   middlewares: [
    //     AuthenticationGuard(), // Add the middleware here
    //   ],
    //   transition: Transition.noTransition,
    // ),
    // GetPage(
    //   name: Routes.profileEmploymentAddEdit,
    //   page: () => AddEmploymentScreen(),
    //   middlewares: [
    //     AuthenticationGuard(), // Add the middleware here
    //   ],
    //   transition: Transition.noTransition,
    // ),
    // //Experince & Training
    // GetPage(
    //   name: Routes.profileExperienceAndTraining,
    //   page: () => ExperienceAndTrainingScreen(),
    //   middlewares: [
    //     AuthenticationGuard(), // Add the middleware here
    //   ],
    //   transition: Transition.noTransition,
    // ),
    // GetPage(
    //   name: Routes.profileExperienceAndTrainingAddEdit,
    //   page: () => AddExperienceAndTrainingScreen(),
    //   middlewares: [
    //     AuthenticationGuard(), // Add the middleware here
    //   ],
    //   transition: Transition.noTransition,
    // ),
    // //Health
    // GetPage(
    //   name: Routes.profileHealth,
    //   page: () => HealthDetailsScreen(),
    //   middlewares: [
    //     AuthenticationGuard(), // Add the middleware here
    //   ],
    //   transition: Transition.noTransition,
    // ),
    // //Incidents
    // GetPage(
    //   name: Routes.profileIncidents,
    //   page: () => IncidentsScreen(),
    //   middlewares: [
    //     AuthenticationGuard(), // Add the middleware here
    //   ],
    //   transition: Transition.noTransition,
    // ),
    // GetPage(
    //   name: Routes.profileIncidentAddEdit,
    //   page: () => AddIncidentsScreen(),
    //   middlewares: [
    //     AuthenticationGuard(), // Add the middleware here
    //   ],
    //   transition: Transition.noTransition,
    // ),
    // //Personal Information
    // GetPage(
    //   name: Routes.profilePersonalInformation,
    //   page: () => PersonalInformationScreen(),
    //   middlewares: [
    //     AuthenticationGuard(), // Add the middleware here
    //   ],
    //   transition: Transition.noTransition,
    // ),
    // //Residance
    // GetPage(
    //   name: Routes.profileResidance,
    //   page: () => ResidenceScreen(),
    //   middlewares: [
    //     AuthenticationGuard(), // Add the middleware here
    //   ],
    //   transition: Transition.noTransition,
    // ),
    // GetPage(
    //   name: Routes.profileResidanceAddEdit,
    //   page: () => AddAddressScreen(),
    //   middlewares: [
    //     AuthenticationGuard(), // Add the middleware here
    //   ],
    //   transition: Transition.noTransition,
    // ),
    // //Violations
    // GetPage(
    //   name: Routes.profileViolations,
    //   page: () => ViolationsScreen(),
    //   middlewares: [
    //     AuthenticationGuard(), // Add the middleware here
    //   ],
    //   transition: Transition.noTransition,
    // ),
    // GetPage(
    //   name: Routes.profileViolationsAddEdit,
    //   page: () => AddViolationScreen(),
    //   middlewares: [
    //     AuthenticationGuard(), // Add the middleware here
    //   ],
    //   transition: Transition.noTransition,
    // ),
    // //Settings
    // //ChangePassword
    // GetPage(
    //   name: Routes.changePassword,
    //   page: () => ChangePasswordScreen(),
    //   middlewares: [
    //     AuthenticationGuard(), // Add the middleware here
    //   ],
    //   transition: Transition.noTransition,
    // ),
    // //Job Posting
    // GetPage(
    //   name: Routes.jobPostingDetails,
    //   page: () => JobPostingDetailsScreen(
    //     isNavigatedInternaly: false,
    //   ),
    //   middlewares: [
    //     AuthenticationGuard(), // Add the middleware here
    //   ],
    //   transition: Transition.noTransition,
    // ),
    // //Unknown
    // GetPage(
    //   name: Routes.unknownRoute,
    //   page: () => const DeepLinkSomethingWentWrong(),
    //   transition: Transition.noTransition,
    // ),
  ];
}
