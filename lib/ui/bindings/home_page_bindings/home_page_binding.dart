import 'package:get/get.dart';
import 'package:rezaei_flutter_test_task/data/repositories/airport_repo/airport_repository.dart';
import 'package:rezaei_flutter_test_task/domain/services/location_service_imp.dart';
import 'package:rezaei_flutter_test_task/ui/views/home/controllers/home_page_controller.dart';

class HomePageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomePageController>(
      () => HomePageController(
        AppLocationService(),
        AirportRepository(),
      ),
      fenix: true,
    );
  }
}
