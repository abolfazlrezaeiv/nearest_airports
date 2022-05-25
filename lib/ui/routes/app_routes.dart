import 'package:get/get.dart';
import 'package:rezaei_flutter_test_task/constants/routes_names.dart';
import 'package:rezaei_flutter_test_task/ui/bindings/home_page_bindings/home_page_binding.dart';
import 'package:rezaei_flutter_test_task/ui/bindings/splash_page_bindings/splash_page_binding.dart';
import 'package:rezaei_flutter_test_task/ui/views/home/home_page.dart';
import 'package:rezaei_flutter_test_task/ui/views/splash_screen/splash_page.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRouteName.splash,
      page: () => const SplashScreen(),
      binding: SplashPageBinding(),
    ),
    GetPage(
      name: AppRouteName.home,
      page: () => const HomePage(),
      binding: HomePageBinding(),
    ),
  ];
}
