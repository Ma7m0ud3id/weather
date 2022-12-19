import 'dart:convert';
import 'package:http/http.dart'as http;
import 'package:weather/Model.dart';
class ApiModel {


  static Future<MOdel> getSources(
      {required String country}) async {
    // call api
    var uri = Uri.parse('http://api.weatherstack.com/current?access_key=f8c781f3a30ee7579af0bc2cb6db194a&query=$country}');
    // var uri = Uri.https(
    //     'api.weatherstack.com',
    //     '/current',
    //     {"access_key":'f8c781f3a30ee7579af0bc2cb6db194a',
    //       "query":'New York',
    //     });
    var response = await http.get(uri);
    try {
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      var sourcesResponse = MOdel.fromJson(json);
      return sourcesResponse;
    } catch (e) {
      throw e;
    }
  }
}