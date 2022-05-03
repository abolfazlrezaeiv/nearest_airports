import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rezaei_flutter_test_task/constants/app_messages.dart';
import 'package:rezaei_flutter_test_task/constants/app_paddings.dart';
import 'package:rezaei_flutter_test_task/constants/app_sizes.dart';
import 'package:rezaei_flutter_test_task/interface/views/splash_screen/controllers/splash_page_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashPageController splashPageController = Get.find();

  @override
  void initState() {
    splashPageController.getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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