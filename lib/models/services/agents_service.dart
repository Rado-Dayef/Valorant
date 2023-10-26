import 'package:com.rado.valorant/views/constants/app_strings.dart';
import 'package:com.rado.valorant/models/agents_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AgentsService {
  final String url = "${AppStrings.baseUrl}${AppStrings.agentsEndPoint}";

  Future<List<AgentsModel>?> fetchAgents() async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)[AppStrings.dataListName];
      return data.map((agent) => AgentsModel.fromJson(agent)).toList();
    } else {
      return null;
    }
  }
}
