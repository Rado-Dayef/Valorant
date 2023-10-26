import 'package:com.rado.valorant/views/constants/app_strings.dart';
import 'package:com.rado.valorant/models/weapons_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class WeaponsService {
  final String url = "${AppStrings.baseUrl}${AppStrings.weaponsEndPoint}";

  Future<List<WeaponsModel>?> fetchWeapons() async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)[AppStrings.dataListName];
      return data.map((weapon) => WeaponsModel.fromJson(weapon)).toList();
    } else {
      return null;
    }
  }
}
