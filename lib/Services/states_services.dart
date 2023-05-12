import 'dart:convert';

import 'package:covid_19_tracker_app/Model/WorldStatesModel.dart';
import 'package:covid_19_tracker_app/Services/Utilities/app_url.dart';
import 'package:http/http.dart' as http;

class StateServices {

  Future<WorldStatesModel> fetchWorldStatesRecords () async {
    
    final response = await http.get(Uri.parse(AppUrl.worldStateApi));

    if(response.statusCode == 200)
      {
        var data = jsonDecode(response.body.toString());
        return WorldStatesModel.fromJson(data);
      }
    else
      {
        throw Exception('Error');
      }
  }

  Future<List<dynamic>> countriesListApi () async {
    var data;

    final response = await http.get(Uri.parse(AppUrl.countryList));

    if(response.statusCode == 200)
    {
      data = jsonDecode(response.body.toString());
      return data;
    }
    else
    {
      throw Exception('Error');
    }
  }

}