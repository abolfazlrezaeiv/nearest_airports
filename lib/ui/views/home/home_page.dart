import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rezaei_flutter_test_task/constants/app_messages.dart';
import 'package:rezaei_flutter_test_task/constants/app_paddings.dart';
import 'package:rezaei_flutter_test_task/constants/app_sizes.dart';
import 'package:rezaei_flutter_test_task/ui/views/home/controllers/home_page_controller.dart';

class HomePage extends GetView<HomePageController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Obx(() => GoogleMap(
                onMapCreated: controller.onMapCreated,
                initialCameraPosition: CameraPosition(
                  target: controller.currentLocaion.value,
                  zoom: AppSize.s07,
                ),
                markers: controller.markers,
              )),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                MaterialButton(
                  onPressed: () async {
                    await controller.getCurrentLocation();
                    await controller.mapController.animateCamera(
                      CameraUpdate.newLatLng(
                        controller.currentLocaion.value,
                      ),
                    );
                  },
                  color: Colors.blue,
                  textColor: Colors.white,
                  child: SizedBox(
                    height: AppSize.s50,
                    child: Column(
                      children: const [
                        Icon(
                          Icons.location_on,
                          size: AppSize.s24,
                        ),
                        Text(AppMessage.getLocationButtonTitle)
                      ],
                    ),
                  ),
                  padding: AppPadding.p16AllSides,
                ),
                const SizedBox(width: AppSize.s07),
                Expanded(
                  child: MaterialButton(
                    onPressed: () async {
                      await controller.findNearestAirports();
                      await controller.getCurrentLocation();
                      await controller.mapController.animateCamera(
                        CameraUpdate.newLatLng(
                          controller.currentLocaion.value,
                        ),
                      );
                    },
                    color: Colors.blue,
                    textColor: Colors.white,
                    child: SizedBox(
                      height: AppSize.s50,
                      child: Column(
                        children: const [
                          Icon(
                            Icons.local_airport,
                            size: AppSize.s24,
                          ),
                          Text(AppMessage.getNearestAirportButtonTitle)
                        ],
                      ),
                    ),
                    padding: AppPadding.p16AllSides,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
