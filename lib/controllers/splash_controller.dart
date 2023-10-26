import 'package:com.rado.valorant/controllers/home_controller.dart';
import 'package:com.rado.valorant/views/constants/app_strings.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  HomeController homeController = Get.put(HomeController());
  RxBool animate = true.obs;

  @override
  void onInit() {
    homeController.fetchData();
    Future.delayed(
      const Duration(seconds: 6),
          () async {
        Get.offAllNamed(AppStrings.homeRout);
      },
    );
    super.onInit();
  }
}
