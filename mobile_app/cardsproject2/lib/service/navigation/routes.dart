abstract class Routes {
  //Root
  static const root = '/driver-app';
  //Splash
  static const splash = '$root/';
  //Authentication
  static const login = '$root/auth/login';
  static const register = '$root/auth/register';
  static const forgetPassword = '$root/auth/forget-password';
  static const resetPasswordValidator = '$root/reset-password';
  static const resetPassword = '$root/reset-password/set-new-password';
  static const invitation = '$root/invitation';
  //Home
  static const home = '$root/home';
  //Profile
  static const profile = '$root/profile';
  //CDL
  static const profileCdl = '$profile/cdl';
  static const profileCdlAddEdit = '$profileCdl/add-edit';
  //Employment
  static const profileEmployment = '$profile/employment';
  static const profileEmploymentAddEdit = '$profileEmployment/add-edit';
  //Experince & Training
  static const profileExperienceAndTraining =
      '$profile/experiance-and-training';
  static const profileExperienceAndTrainingAddEdit =
      '$profileExperienceAndTraining/add-edit';
  //Health
  static const profileHealth = '$profile/health';
  //Incidents
  static const profileIncidents = '$profile/incidents';
  static const profileIncidentAddEdit = '$profileIncidents/add-edit';
  //Personal Information
  static const profilePersonalInformation = '$profile/health';
  //Residance
  static const profileResidance = '$profile/residance';
  static const profileResidanceAddEdit = '$profileResidance/add-edit';
  //Residance
  static const profileViolations = '$profile/violations';
  static const profileViolationsAddEdit = '$profileViolations/add-edit';
  //Settings
  //Change Password
  static const changePassword = '$root/settings/change-password';
  //Job Postings
  static const jobPostingDetails = '$root/app/JobPostings';
  //Unknown
  static const unknownRoute = '$root/unknownRoute';
}
