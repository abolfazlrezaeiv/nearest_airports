import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rezaei_flutter_test_task/constants/routes_names.dart';
import 'package:rezaei_flutter_test_task/interface/routes/app_routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRouteName.splash,
      getPages: AppPages.pages,
      smartManagement: SmartManagement.full,
    );
  }
}
