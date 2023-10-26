import 'package:com.rado.valorant/views/constants/app_strings.dart';

class AgentsAbilityModel {
  final String displayName;
  final String description;
  final String displayIcon;

  AgentsAbilityModel({
    required this.displayName,
    required this.description,
    required this.displayIcon,
  });

  factory AgentsAbilityModel.fromJson(Map<String, dynamic> json) {
    return AgentsAbilityModel(
      displayName: json[AppStrings.displayNameModelsText],
      description: json[AppStrings.descriptionModelsText],
      displayIcon: json[AppStrings.displayIconModelsText],
    );
  }
}