import 'package:com.rado.valorant/models/agents_ability_model.dart';
import 'package:com.rado.valorant/views/constants/app_strings.dart';
import 'package:com.rado.valorant/models/agents_role_model.dart';
import 'package:flutter/material.dart';

class AgentsModel {
  String? background;
  String? displayName;
  String? description;
  String? fullPortrait;
  AgentsRoleModel? role;
  bool? isPlayableCharacter;
  List<AgentsAbilityModel>? abilities;

  AgentsModel({
    this.role,
    this.abilities,
    this.background,
    this.displayName,
    this.description,
    this.fullPortrait,
    this.isPlayableCharacter,
  });

  AgentsModel.fromJson(Map<String, dynamic> json) {
    try {
      background = json[AppStrings.backgroundModelsText];
      displayName = json[AppStrings.displayNameModelsText];
      description = json[AppStrings.descriptionModelsText];
      fullPortrait = json[AppStrings.fullPortraitModelsText];
      isPlayableCharacter = json[AppStrings.isPlayableCharacterModelsText];
      role = AgentsRoleModel.fromJson(json[AppStrings.roleModelsText] ?? {});
      abilities = (json[AppStrings.abilitiesModelsText] as List<dynamic>?)?.map((ability) => AgentsAbilityModel.fromJson(ability ?? {})).toList() ?? [];
    } catch (e) {
      debugPrint("${AppStrings.modelsErrorText}$e");
    }
  }
}
