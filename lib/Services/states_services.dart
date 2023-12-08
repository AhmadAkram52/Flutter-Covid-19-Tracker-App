import 'dart:convert';

import 'package:covid_tracker/Models/WorldStatesModel.dart';
import 'package:covid_tracker/util/app_url.dart';
import 'package:http/http.dart' as http;

class StatesServices {
  Future<WorldStates> getState() async {
    final response = await http.get(Uri.parse(AppUrl.worldStates));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return WorldStates.fromJson(data);
    } else {
      throw Exception("error");
    }
  }
}
