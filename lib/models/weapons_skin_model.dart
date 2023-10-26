import 'package:com.rado.valorant/views/constants/app_strings.dart';
import 'package:flutter/material.dart';

class WeaponsSkinModel {
  String? displayName;
  String? displayIcon;

  WeaponsSkinModel({
    this.displayName,
    this.displayIcon,
  });

  WeaponsSkinModel.fromJson(Map<String, dynamic> json) {
    try {
      displayName = json[AppStrings.displayNameModelsText];
      displayIcon = json[AppStrings.displayIconModelsText];
    } catch (e) {
      debugPrint("${AppStrings.modelsErrorText}$e");
    }
  }
}
