import 'package:get/get.dart';
import 'package:rezaei_flutter_test_task/data/database/database_helper.dart';
import 'package:rezaei_flutter_test_task/data/repositories/airport_repository.dart';
import 'package:rezaei_flutter_test_task/data/services/location_service.dart';
import 'package:rezaei_flutter_test_task/ui/views/home/controllers/home_page_controller.dart';

class HomePageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomePageController>(
      () => HomePageController(
        LocationService(),
        AirportRepository(DatabaseHelper()),
      ),
      fenix: true,
    );
  }
}
