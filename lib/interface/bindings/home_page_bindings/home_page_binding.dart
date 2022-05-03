import 'package:get/get.dart';
import 'package:rezaei_flutter_test_task/interface/views/home/controllers/home_page_controller.dart';

class HomePageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomePageController>(
      () => HomePageController(),
      fenix: true,
    );
  }
}
