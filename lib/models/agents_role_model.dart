import 'package:com.rado.valorant/views/constants/app_strings.dart';

class AgentsRoleModel {
  final String displayName;
  final String description;
  final String displayIcon;

  AgentsRoleModel({
    required this.displayName,
    required this.description,
    required this.displayIcon,
  });

  factory AgentsRoleModel.fromJson(Map<String, dynamic> json) {
    return AgentsRoleModel(
      displayName: json[AppStrings.displayNameModelsText],
      description: json[AppStrings.descriptionModelsText],
      displayIcon: json[AppStrings.displayIconModelsText],
    );
  }
}