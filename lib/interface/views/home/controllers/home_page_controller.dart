import 'package:get/get.dart';

class HomePageController extends GetxController {
  late RxList<String> userItemList = RxList<String>();

  RxBool playVideo = false.obs;
}
