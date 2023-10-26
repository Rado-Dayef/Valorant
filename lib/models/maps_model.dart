import 'package:com.rado.valorant/views/constants/app_strings.dart';
import 'package:flutter/material.dart';

class MapsModel {
  String? splash;
  String? displayName;
  String? coordinates;
  String? displayIcon;
  String? narrativeDescription;

  MapsModel({
    this.splash,
    this.coordinates,
    this.displayIcon,
    this.displayName,
    this.narrativeDescription,

  });

  MapsModel.fromJson(Map<String, dynamic> json) {
    try {
      splash = json[AppStrings.splashModelsText];
      coordinates = json[AppStrings.coordinatesModelsText];
      displayIcon = json[AppStrings.displayIconModelsText];
      displayName = json[AppStrings.displayNameModelsText];
      narrativeDescription = json[AppStrings.narrativeDescriptionModelsText];
    } catch (e) {
      debugPrint("${AppStrings.modelsErrorText}$e");
    }
  }
}
