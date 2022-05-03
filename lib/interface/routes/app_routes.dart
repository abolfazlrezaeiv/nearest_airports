import 'package:get/get.dart';
import 'package:rezaei_flutter_test_task/constants/routes_names.dart';
import 'package:rezaei_flutter_test_task/interface/bindings/airport_page_bindings/airport_page_binding.dart';
import 'package:rezaei_flutter_test_task/interface/bindings/home_page_bindings/home_page_binding.dart';
import 'package:rezaei_flutter_test_task/interface/views/airport/airport_page.dart';
import 'package:rezaei_flutter_test_task/interface/views/home/home_page.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRouteName.home,
      page: () => const HomePage(),
      binding: HomePageBinding(),
    ),
    GetPage(
      name: AppRouteName.airport,
      page: () => const AirportPage(),
      binding: AirportPageBinding(),
    ),
  ];
}
