import 'package:get/get.dart';

import '../modules/coming_soon/bindings/coming_soon_binding.dart';
import '../modules/coming_soon/views/coming_soon_view.dart';
import '../modules/create_account/bindings/create_account_binding.dart';
import '../modules/create_account/views/create_account_view.dart';
import '../modules/diet_control/bindings/diet_control_binding.dart';
import '../modules/diet_control/views/diet_control_view.dart';
import '../modules/fitness_care/bindings/fitness_care_binding.dart';
import '../modules/fitness_care/views/fitness_care_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/medicine_disease_info/bindings/medicine_disease_info_binding.dart';
import '../modules/medicine_disease_info/views/medicine_disease_info_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/reset_pass/bindings/reset_pass_binding.dart';
import '../modules/reset_pass/views/reset_pass_view.dart';
import '../modules/settings/bindings/settings_binding.dart';
import '../modules/settings/views/settings_view.dart';
import '../modules/welcome/bindings/welcome_binding.dart';
import '../modules/welcome/views/welcome_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.CREATE_ACCOUNT,
      page: () => CreateAccountView(),
      binding: CreateAccountBinding(),
    ),
    GetPage(
      name: _Paths.WELCOME,
      page: () => WelcomeView(),
      binding: WelcomeBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.SETTINGS,
      page: () => SettingsView(),
      binding: SettingsBinding(),
    ),
    GetPage(
      name: _Paths.DIET_CONTROL,
      page: () => DietControlView(),
      binding: DietControlBinding(),
    ),
    GetPage(
      name: _Paths.FITNESS_CARE,
      page: () => FitnessCareView(),
      binding: FitnessCareBinding(),
    ),
    GetPage(
      name: _Paths.MEDICINE_DISEASE_INFO,
      page: () => MedicineDiseaseInfoView(),
      binding: MedicineDiseaseInfoBinding(),
    ),
    GetPage(
      name: _Paths.COMING_SOON,
      page: () => ComingSoonView(),
      binding: ComingSoonBinding(),
    ),
    GetPage(
      name: _Paths.RESET_PASS,
      page: () => ResetPassView(),
      binding: ResetPassBinding(),
    ),
  ];
}
