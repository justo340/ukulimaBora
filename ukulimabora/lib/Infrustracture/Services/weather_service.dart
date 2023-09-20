import 'dart:convert' as convert;

import 'package:http/http.dart' as http;

import 'package:ukulimabora/Shared/Common/keys.dart';

class WeatherForcast {
  Future<Map<String, dynamic>> getWeather() async {
    final Uri url = Uri.parse(
        'http://api.openweathermap.org/data/2.5/onecall?lat=-1.2921&lon=36.8219&units=metric&appid=$openWeatherKey',);

    final http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      final dynamic data = convert.jsonDecode(response.body);
      if (data != null) {
        return data as Map<String, dynamic>;
      }
      throw Exception(data['error_message']);
    } else {
      throw Exception('Failed to fetch suggestion');
    }
  }
}
