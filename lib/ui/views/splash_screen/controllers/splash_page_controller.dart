import 'package:get/get.dart';
import 'package:rezaei_flutter_test_task/constants/app_messages.dart';
import 'package:rezaei_flutter_test_task/constants/routes_names.dart';
import 'package:rezaei_flutter_test_task/data/repositories/airport_repo/airport_repository.dart';

class SplashPageController extends GetxController {
  SplashPageController(this.airportRepository);

  final AirportRepository airportRepository;

  getData() {
    try {
      airportRepository.getAll().whenComplete(
            () => Get.toNamed(AppRouteName.home),
          );
    } on Exception {
      Get.snackbar(AppMessage.empty, AppMessage.networkRequestFailedMessage);
    }
  }
}
