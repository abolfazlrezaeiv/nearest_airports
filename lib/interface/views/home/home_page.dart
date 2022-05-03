import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rezaei_flutter_test_task/constants/app_paddings.dart';
import 'package:rezaei_flutter_test_task/constants/app_sizes.dart';
import 'package:rezaei_flutter_test_task/interface/views/home/controllers/home_page_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomePageController homeController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MaterialButton(
          onPressed: () {},
          color: Colors.blue,
          textColor: Colors.white,
          child: const Icon(
            Icons.location_on,
            size: AppSize.s24,
          ),
          padding: AppPadding.p16AllSides,
          shape: const CircleBorder(),
        ),
      ),
    );
  }
}
