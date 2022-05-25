import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:rezaei_flutter_test_task/constants/app_messages.dart';
import 'package:rezaei_flutter_test_task/domain/interfaces/ilocation_service.dart';

class LocationService implements ILocationService {
  @override
  Future<Position> getCurrentLocation() async {
    if (!await Geolocator.isLocationServiceEnabled()) {
      Get.snackbar(AppMessage.empty, AppMessage.requestLocationTurnOnDialog);
    }
    LocationPermission permission;
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      requestPermission(permission);
      if (permission == LocationPermission.denied) {
        requestPermission(permission);
      }
    }
    if (permission == LocationPermission.deniedForever) {
      requestPermission(permission);
    }
    return Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  void requestPermission(LocationPermission permission) async {
    Get.snackbar(
        AppMessage.empty, AppMessage.requestLocationPermissionDialogMessage);
    permission = await Geolocator.requestPermission();
  }
}
