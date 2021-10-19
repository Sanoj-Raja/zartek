import 'package:get/get.dart';

import 'package:zartek/app/modules/auth/bindings/auth_binding.dart';
import 'package:zartek/app/modules/auth/views/auth_view.dart';
import 'package:zartek/app/modules/checkout/bindings/checkout_binding.dart';
import 'package:zartek/app/modules/checkout/views/checkout_view.dart';
import 'package:zartek/app/modules/home/bindings/home_binding.dart';
import 'package:zartek/app/modules/home/views/home_view.dart';
import 'package:zartek/app/modules/splash/bindings/splash_binding.dart';
import 'package:zartek/app/modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.CHECKOUT,
      page: () => CheckoutView(),
      binding: CheckoutBinding(),
    ),
    GetPage(
      name: _Paths.AUTH,
      page: () => AuthView(),
      binding: AuthBinding(),
    ),
  ];
}
