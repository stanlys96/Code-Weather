import 'dart:convert';

import 'package:weatherapp_starter_project/model/weather_data.dart';
import 'package:weatherapp_starter_project/model/weather_data_current.dart';
import 'package:weatherapp_starter_project/model/weather_data_daily.dart';
import 'package:weatherapp_starter_project/model/weather_data_hourly.dart';
import 'package:weatherapp_starter_project/utils/api_url.dart';
import 'package:dio/dio.dart';

class FetchWeatherApi {
  Dio dio = Dio();
  WeatherData? weatherData;

  Future<WeatherData> processData(lat, lon) async {
    var response = await dio.get(apiURL(lat, lon));
    var jsonString = jsonDecode(jsonEncode(response.data));
    weatherData = WeatherData(
      WeatherDataCurrent.fromJson(jsonString),
      WeatherDataHourly.fromJson(jsonString),
      WeatherDataDaily.fromJson(jsonString),
    );

    return weatherData!;
  }
}
