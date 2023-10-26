import 'package:com.rado.valorant/views/constants/app_strings.dart';
import 'package:com.rado.valorant/models/weapons_skin_model.dart';
import 'package:flutter/material.dart';

class WeaponsModel {
  String? category;
  String? displayIcon;
  String? displayName;
  List<WeaponsSkinModel>? skins;
  Map<String, dynamic>? shopData;
  Map<String, dynamic>? weaponStats;

  WeaponsModel({
    this.skins,
    this.category,
    this.shopData,
    this.weaponStats,
    this.displayName,
    this.displayIcon,
  });

  WeaponsModel.fromJson(Map<String, dynamic> json) {
    try {
      displayName = json[AppStrings.displayNameModelsText];
      category = json[AppStrings.categoryModelsText];
      displayIcon = json[AppStrings.displayIconModelsText];
      weaponStats = json[AppStrings.weaponStatsModelsText];
      shopData = json[AppStrings.shopDataModelsText];
      skins = (json[AppStrings.skinsModelsText] as List<dynamic>?)?.map((skin) => WeaponsSkinModel.fromJson(skin ?? {})).toList() ?? [];
    } catch (e) {
      debugPrint("${AppStrings.modelsErrorText}$e");
    }
  }
}
