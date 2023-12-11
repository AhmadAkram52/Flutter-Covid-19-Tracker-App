import 'dart:convert';

import 'package:covid_tracker/Models/CountriesListModel.dart';
import 'package:covid_tracker/util/app_url.dart';
import 'package:http/http.dart' as http;

class CountriesList {
  Future<List<CountriesListModel>> getCountriesList(
      List<CountriesListModel> cList) async {
    final response = await http.get(Uri.parse(AppUrl.countriesList));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      cList.clear();
      for (Map i in data) {
        cList.add(CountriesListModel.fromJson(i));
      }
      return cList;
    } else {
      throw Exception('Error');
    }
  }
}
