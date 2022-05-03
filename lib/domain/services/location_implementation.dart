import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:rezaei_flutter_test_task/constants/app_messages.dart';
import 'package:rezaei_flutter_test_task/domain/base/base_location_service.dart';

class AppLocationService implements AppBaseLocationService {
  @override
  Future<Position> getCurrentLocation() async {
    if (!await Geolocator.isLocationServiceEnabled()) {
      Get.snackbar(AppMessage.empty, AppMessage.requestLocationTurnOnDialog);
    }
    LocationPermission permission;
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      Get.snackbar(
          AppMessage.empty, AppMessage.requestLocationPermissionDialogMessage);
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Get.snackbar(AppMessage.empty,
            AppMessage.requestLocationPermissionDialogMessage);
        permission = await Geolocator.requestPermission();
      }
    }
    if (permission == LocationPermission.deniedForever) {
      Get.snackbar(
          AppMessage.empty, AppMessage.requestLocationPermissionDialogMessage);
      permission = await Geolocator.requestPermission();
    }
    return Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }
}
