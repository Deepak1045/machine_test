import 'package:get/get.dart';
import 'app_routes.dart';
import '../../features/splash/views/splash_view.dart';
import '../../features/splash/bindings/splash_binding.dart';
import '../../features/onboarding/views/onboarding_view.dart';
import '../../features/onboarding/bindings/onboarding_binding.dart';
import '../../features/auth/views/login_view.dart';
import '../../features/auth/bindings/auth_binding.dart';
import '../../features/auth/views/otp_view.dart';
import '../../features/auth/views/signup_view.dart';
import '../../features/home/views/home_view.dart';
import '../../features/home/bindings/home_binding.dart';

class AppPages {
  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: Routes.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.ONBOARDING,
      page: () => const OnboardingView(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => const LoginView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.SIGNUP,
      page: () => const SignupView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.OTP,
      page: () => const OtpView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
  ];
}
