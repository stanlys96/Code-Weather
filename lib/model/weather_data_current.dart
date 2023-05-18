// instance of the

class WeatherDataCurrent {
  final Current current;
  WeatherDataCurrent({required this.current});

  factory WeatherDataCurrent.fromJson(Map<String, dynamic> json) =>
      WeatherDataCurrent(current: Current.fromJson(json['current']));
}

class Current {
  int? temp;
  int? humidity;
  int? clouds;
  double? windSpeed;
  List<Weather>? weather;
  int? feelsLike;
  double? uvi;
  int? pressure;
  int? visibility;
  double? dewPoint;

  Current({
    this.temp,
    this.humidity,
    this.clouds,
    this.windSpeed,
    this.weather,
    this.feelsLike,
    this.uvi,
    this.pressure,
    this.visibility,
    this.dewPoint,
  });

  factory Current.fromJson(Map<String, dynamic> json) => Current(
        temp: (json['temp'] as num?)?.round(),
        humidity: json['humidity'] as int?,
        clouds: json['clouds'] as int?,
        feelsLike: (json['feels_like'] as num?)?.round(),
        windSpeed: (json['wind_speed'] as num?)?.toDouble(),
        weather: (json['weather'] as List<dynamic>?)
            ?.map((e) => Weather.fromJson(e as Map<String, dynamic>))
            .toList(),
        uvi: (json['uvi'] as num?)?.toDouble(),
        pressure: (json['pressure'] as num?)?.round(),
        visibility: (json['visibility'] as num?)?.round(),
        dewPoint: (json['dew_point'] as num?)?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        'temp': temp,
        'humidity': humidity,
        'clouds': clouds,
        'wind_speed': windSpeed,
        'weather': weather?.map((e) => e.toJson()).toList(),
        'feels_like': feelsLike,
        'uvi': uvi,
        'pressure': pressure,
        'visibility': visibility,
        'dew_point': dewPoint,
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
