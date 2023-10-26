import 'package:com.rado.valorant/models/services/weapons_service.dart';
import 'package:com.rado.valorant/models/services/agents_service.dart';
import 'package:com.rado.valorant/models/services/maps_service.dart';
import 'package:com.rado.valorant/views/constants/app_strings.dart';
import 'package:com.rado.valorant/models/agents_model.dart';
import 'package:com.rado.valorant/models/maps_model.dart';
import 'package:com.rado.valorant/models/weapons_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final WeaponsService weaponsService = WeaponsService();
  List<WeaponsModel> weapons = RxList<WeaponsModel>();
  final AgentsService agentsService = AgentsService();
  RxList<AgentsModel> agents = RxList<AgentsModel>();
  final MapsService mapsService = MapsService();
  List<MapsModel> maps = RxList<MapsModel>();

  HomeController(){
    fetchData();
  }

  void fetchData() async {
    try {
      final weaponsList = await weaponsService.fetchWeapons();
      final agentList = await agentsService.fetchAgents();
      final mapsList = await mapsService.fetchMaps();

      if (weaponsList != null && agentList != null && mapsList != null) {
        weapons = weaponsList;
        agents.assignAll(agentList.where((agent) => agent.isPlayableCharacter == true).toList());
        maps = mapsList;
      } else {
        agents.assign(AgentsModel());
        debugPrint(AppStrings.dataIsNullText);
      }
    } catch (e) {
      debugPrint("${AppStrings.errorFetchingAgentDataText}$e");
    }
    update();
  }

  int currentIndex = 1;
  void changeTab(int index) {
    currentIndex = index;
    update();
  }
}
