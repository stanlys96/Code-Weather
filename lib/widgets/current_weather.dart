import 'package:flutter/material.dart';
import 'package:weatherapp_starter_project/model/weather_data_current.dart';
import 'package:weatherapp_starter_project/utils/custom_colors.dart';

class CurrentWeather extends StatelessWidget {
  final WeatherDataCurrent weatherDataCurrent;
  const CurrentWeather({super.key, required this.weatherDataCurrent});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // temperature area
        TemperatureArea(),
        const SizedBox(
          height: 15,
        ),
        Text(
          'Feels like ${weatherDataCurrent.current.feelsLike}°C',
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        // more details - windspeed, humidity, clouds
        CurrentWeatherMoreDetails(),
      ],
    );
  }

  Widget CurrentWeatherMoreDetails() {
    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: 15.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                'Wind: ${weatherDataCurrent.current.windSpeed}km/h',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(width: 15),
            Expanded(
              child: Text(
                'Humidity: ${weatherDataCurrent.current.humidity}%',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(width: 15),
            Expanded(
              child: Text(
                'UV index: ${weatherDataCurrent.current.uvi}',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
      const SizedBox(
        height: 10,
      ),
      Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: 15.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                'Pressure: ${weatherDataCurrent.current.pressure}hPa',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(width: 15),
            Expanded(
              child: Text(
                'Visibility: ${weatherDataCurrent.current.visibility}km',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(width: 15),
            Expanded(
              child: Text(
                'Dew point: ${weatherDataCurrent.current.dewPoint}°C',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      )
    ]);
  }

  Widget TemperatureArea() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Image.asset(
          "assets/weather/${weatherDataCurrent.current.weather![0].icon}.png",
          height: 80,
          width: 80,
        ),
        Container(
          height: 50,
          width: 1,
          color: CustomColors.dividerLine,
        ),
        Text(
          "${weatherDataCurrent.current.temp!.toInt()}°",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 68,
            color: CustomColors.textColorBlack,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${weatherDataCurrent.current.weather![0].description}",
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            Text(
              "${weatherDataCurrent.current.weather![0].main}",
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
