import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rezaei_flutter_test_task/constants/app_messages.dart';
import 'package:rezaei_flutter_test_task/constants/app_paddings.dart';
import 'package:rezaei_flutter_test_task/constants/app_sizes.dart';
import 'package:rezaei_flutter_test_task/ui/views/splash_screen/controllers/splash_page_controller.dart';

class SplashScreen extends GetView<SplashPageController> {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.onInit();
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(AppMessage.splashScreenLoadingText),
          SizedBox(height: AppSize.s07),
          Padding(
            padding: AppPadding.p16AllSides,
            child: LinearProgressIndicator(),
          ),
        ],
      ),
    );
  }
}
