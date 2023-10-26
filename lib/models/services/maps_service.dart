import 'package:com.rado.valorant/views/constants/app_strings.dart';
import 'package:com.rado.valorant/models/maps_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MapsService {
  final String url = "${AppStrings.baseUrl}${AppStrings.mapsEndPoint}";

  Future<List<MapsModel>?> fetchMaps() async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)[AppStrings.dataListName];
      return data.map((agent) => MapsModel.fromJson(agent)).toList();
    } else {
      return null;
    }
  }
}
