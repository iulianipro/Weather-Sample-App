import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sampleprojekt/model/weather_model.dart';

class WeatherApiClinet {
  Future<Weather>? getCurrentWeather(String? location) async {
    var endpoint = Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=$location&units=metric&appid={API Key}");

    var response = await http.get(endpoint);
    var body = jsonDecode(response.body);
    //print(Weather.fromJson(body).icon);
    return Weather.fromJson(body);
  }
}
