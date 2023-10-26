import 'package:com.rado.valorant/views/screens/weapon_skin_details_screen.dart';
import 'package:com.rado.valorant/views/screens/weapon_details_screen.dart';
import 'package:com.rado.valorant/views/screens/agent_details_screen.dart';
import 'package:com.rado.valorant/views/screens/map_details_screen.dart';
import 'package:com.rado.valorant/views/constants/app_strings.dart';
import 'package:com.rado.valorant/views/screens/splash_screen.dart';
import 'package:com.rado.valorant/views/screens/home_screen.dart';
import 'package:get/get.dart';

List<GetPage> appPages() {
  return [
    GetPage(
      name: AppStrings.splashRout,
      page: () => const SplashScreen(),
        transition: Transition.noTransition
    ),
    GetPage(
      name: AppStrings.homeRout,
      page: () => const HomeScreen(),
      transition: Transition.noTransition
    ),
    GetPage(
      name: AppStrings.weaponDetailsRout,
      page: () => const WeaponDetailsScreen(),
      transition: Transition.noTransition
    ),
    GetPage(
        name: AppStrings.weaponSkinDetailsRout,
        page: () => const WeaponSkinDetailsScreen(),
        transition: Transition.noTransition
    ),
    GetPage(
      name: AppStrings.agentDetailsRout,
      page: () => const AgentDetailsScreen(),
      transition: Transition.noTransition
    ),
    GetPage(
      name: AppStrings.mapDetailsRout,
      page: () => const MapDetailsScreen(),
      transition: Transition.noTransition
    ),
  ];
}
