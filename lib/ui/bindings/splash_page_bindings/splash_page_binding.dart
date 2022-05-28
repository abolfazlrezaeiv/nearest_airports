import 'package:get/get.dart';
import 'package:rezaei_flutter_test_task/data/database/database_helper.dart';
import 'package:rezaei_flutter_test_task/data/repositories/airport_repository.dart';
import 'package:rezaei_flutter_test_task/ui/views/splash_screen/controllers/splash_page_controller.dart';

class SplashPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashPageController>(
      () => SplashPageController(
        AirportRepository(DatabaseHelper()),
      ),
      fenix: true,
    );
  }
}
