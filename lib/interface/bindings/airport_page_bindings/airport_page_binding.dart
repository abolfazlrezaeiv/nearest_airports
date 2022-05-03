import 'package:get/get.dart';
import 'package:rezaei_flutter_test_task/interface/views/airport/controllers/airport_page_controller.dart';

class AirportPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AirportPageController>(
      () => AirportPageController(),
      fenix: true,
    );
  }
}
