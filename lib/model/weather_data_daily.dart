class WeatherDataDaily {
  List<Daily> daily;
  WeatherDataDaily({required this.daily});

  factory WeatherDataDaily.fromJson(Map<String, dynamic> json) =>
      WeatherDataDaily(
        daily: List<Daily>.from(
          json['daily'].map(
            (e) => Daily.fromJson(e),
          ),
        ),
      );
}

class Daily {
  int? dt;
  int? sunrise;
  int? sunset;
  int? moonrise;
  int? moonset;
  double? moonPhase;
  Temp? temp;
  FeelsLike? feelsLike;
  int? pressure;
  int? humidity;
  double? dewPoint;
  double? windSpeed;
  int? windDeg;
  double? windGust;
  List<Weather>? weather;
  int? clouds;
  double? uvi;
  double? rain;

  Daily({
    this.dt,
    this.sunrise,
    this.sunset,
    this.moonrise,
    this.moonset,
    this.moonPhase,
    this.temp,
    this.feelsLike,
    this.pressure,
    this.humidity,
    this.dewPoint,
    this.windSpeed,
    this.windDeg,
    this.windGust,
    this.weather,
    this.clouds,
    this.uvi,
    this.rain,
  });

  factory Daily.fromJson(Map<String, dynamic> json) => Daily(
        dt: json['dt'] as int?,
        sunrise: json['sunrise'] as int?,
        sunset: json['sunset'] as int?,
        moonrise: json['moonrise'] as int?,
        moonset: json['moonset'] as int?,
        moonPhase: (json['moon_phase'] as num?)?.toDouble(),
        temp: json['temp'] == null
            ? null
            : Temp.fromJson(json['temp'] as Map<String, dynamic>),
        feelsLike: json['feels_like'] == null
            ? null
            : FeelsLike.fromJson(json['feels_like'] as Map<String, dynamic>),
        pressure: json['pressure'] as int?,
        humidity: json['humidity'] as int?,
        dewPoint: (json['dew_point'] as num?)?.toDouble(),
        windSpeed: (json['wind_speed'] as num?)?.toDouble(),
        windDeg: json['wind_deg'] as int?,
        windGust: (json['wind_gust'] as num?)?.toDouble(),
        weather: (json['weather'] as List<dynamic>?)
            ?.map((e) => Weather.fromJson(e as Map<String, dynamic>))
            .toList(),
        clouds: json['clouds'] as int?,
        uvi: (json['uvi'] as num?)?.toDouble(),
        rain: (json['rain'] as num?)?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        'dt': dt,
        'sunrise': sunrise,
        'sunset': sunset,
        'moonrise': moonrise,
        'moonset': moonset,
        'moon_phase': moonPhase,
        'temp': temp?.toJson(),
        'feels_like': feelsLike?.toJson(),
        'pressure': pressure,
        'humidity': humidity,
        'dew_point': dewPoint,
        'wind_speed': windSpeed,
        'wind_deg': windDeg,
        'wind_gust': windGust,
        'weather': weather?.map((e) => e.toJson()).toList(),
        'clouds': clouds,
        'uvi': uvi,
        'rain': rain,
      };
}

class Weather {
  int? id;
  String? main;
  String? description;
  String? icon;

  Weather({
    this.id,
    this.main,
    this.description,
    this.icon,
  });

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        id: json['id'] as int?,
        main: json['main'] as String?,
        description: json['description'] as String?,
        icon: json['icon'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'main': main,
        'description': description,
        'icon': icon,
      };
}

class Temp {
  double? day;
  int? min;
  int? max;
  double? night;
  double? eve;
  double? morn;

  Temp({this.day, this.min, this.max, this.night, this.eve, this.morn});

  factory Temp.fromJson(Map<String, dynamic> json) => Temp(
        day: (json['day'] as num?)?.toDouble(),
        min: (json['min'] as num?)?.round(),
        max: (json['max'] as num?)?.round(),
        night: (json['night'] as num?)?.toDouble(),
        eve: (json['eve'] as num?)?.toDouble(),
        morn: (json['morn'] as num?)?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        'day': day,
        'min': min,
        'max': max,
        'night': night,
        'eve': eve,
        'morn': morn,
      };
}

class FeelsLike {
  double? day;
  double? night;
  double? eve;
  double? morn;

  FeelsLike({this.day, this.night, this.eve, this.morn});

  factory FeelsLike.fromJson(Map<String, dynamic> json) => FeelsLike(
        day: (json['day'] as num?)?.toDouble(),
        night: (json['night'] as num?)?.toDouble(),
        eve: (json['eve'] as num?)?.toDouble(),
        morn: (json['morn'] as num?)?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        'day': day,
        'night': night,
        'eve': eve,
        'morn': morn,
      };
}
