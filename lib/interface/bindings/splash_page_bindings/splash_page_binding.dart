import 'package:get/get.dart';
import 'package:rezaei_flutter_test_task/data/repositories/airport_repo/airport_repository.dart';
import 'package:rezaei_flutter_test_task/interface/views/splash_screen/controllers/splash_page_controller.dart';

class SplashPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashPageController>(
      () => SplashPageController(
        AirportRepository(),
      ),
      fenix: true,
    );
  }
}
