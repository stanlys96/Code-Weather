import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weatherapp_starter_project/model/weather_data_daily.dart';
import 'package:weatherapp_starter_project/utils/custom_colors.dart';

class DailyDataForecast extends StatefulWidget {
  final WeatherDataDaily weatherDataDaily;
  const DailyDataForecast({required this.weatherDataDaily});

  @override
  State<DailyDataForecast> createState() => _DailyDataForecastState();
}

class _DailyDataForecastState extends State<DailyDataForecast> {
  // String Manipulation
  String getDay(final day) {
    DateTime time = DateTime.fromMillisecondsSinceEpoch(day * 1000);
    final x = DateFormat('EEE, MMM d').format(time);
    return x;
  }

  String getCurrentDay(final day) {
    DateTime time = DateTime.fromMillisecondsSinceEpoch(day * 1000);
    final x = DateFormat('EEE').format(time);
    return x;
  }

  String getCurrentDate(final day) {
    DateTime time = DateTime.fromMillisecondsSinceEpoch(day * 1000);
    final x = DateFormat('d').format(time);
    return x;
  }

  String getTime(final thisTime) {
    DateTime time = DateTime.fromMillisecondsSinceEpoch(thisTime * 1000);
    final x = DateFormat('HH:mm').format(time);
    return x;
  }

  int globalIndex = -1;

  void setIndex(final int newIndex) {
    setState(() {
      globalIndex = newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: CustomColors.dividerLine.withAlpha(150),
        borderRadius: BorderRadius.circular(20),
      ),
      child: SingleChildScrollView(
        child: globalIndex == -1 ? DailyList() : DailyDetail(),
      ),
    );
  }

  Widget DailyList() {
    return SizedBox(
      height: 350,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: widget.weatherDataDaily.daily.length > 7
            ? 7
            : widget.weatherDataDaily.daily.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              InkWell(
                onTap: () {
                  setIndex(index);
                },
                child: Container(
                  height: 60,
                  padding: const EdgeInsets.only(
                    left: 10,
                    right: 10,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 80,
                        child: Text(
                          getDay(widget.weatherDataDaily.daily[index].dt),
                          style: const TextStyle(
                            color: CustomColors.textColorBlack,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                        child: Row(
                          children: [
                            Text(
                                "${widget.weatherDataDaily.daily[index].temp!.max}°/${widget.weatherDataDaily.daily[index].temp!.min}°"),
                            SizedBox(width: 15.0),
                            Image.asset(
                              "assets/weather/${widget.weatherDataDaily.daily[index].weather![0].icon}.png",
                            ),
                            SizedBox(width: 15.0),
                            Icon(Icons.arrow_right),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 1.5,
                color: CustomColors.dividerLine,
              ),
            ],
          );
        },
      ),
    );
  }

  Widget DailyDetail() {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              height: 50,
              width: MediaQuery.of(context).size.width * 0.75,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: widget.weatherDataDaily.daily.length > 7
                    ? 7
                    : widget.weatherDataDaily.daily.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setIndex(index);
                    },
                    child: Container(
                      padding: EdgeInsets.all(5),
                      margin: EdgeInsets.only(right: 5),
                      decoration: BoxDecoration(
                        gradient: globalIndex == index
                            ? LinearGradient(
                                colors: [
                                  CustomColors.firstGradientColor,
                                  CustomColors.secondGradientColor
                                ],
                              )
                            : null,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            getCurrentDay(
                                widget.weatherDataDaily.daily[index].dt),
                            style: TextStyle(
                              color: globalIndex == index
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                          Text(
                            getCurrentDate(
                                widget.weatherDataDaily.daily[index].dt),
                            style: TextStyle(
                              color: globalIndex == index
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            InkWell(
              onTap: () {
                setIndex(-1);
              },
              child: Icon(Icons.menu),
            ),
          ],
        ),
        SizedBox(height: 10),
        Container(
          width: double.infinity,
          height: 1.5,
          color: CustomColors.dividerLine,
        ),
        SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  (widget.weatherDataDaily.daily[globalIndex].weather![0]
                              .description?[0]
                              .toUpperCase() ??
                          "") +
                      (widget.weatherDataDaily.daily[globalIndex].weather![0]
                              .description
                              ?.substring(1) ??
                          ""),
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(widget
                        .weatherDataDaily.daily[globalIndex].weather![0].main ??
                    ""),
              ],
            ),
            Row(
              children: [
                Text(
                    "${widget.weatherDataDaily.daily[globalIndex].temp!.max}°/${widget.weatherDataDaily.daily[globalIndex].temp!.min}°"),
                SizedBox(width: 15.0),
                Image.asset(
                  "assets/weather/${widget.weatherDataDaily.daily[globalIndex].weather![0].icon}.png",
                  width: 30,
                  height: 30,
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 10),
        Container(
          width: double.infinity,
          height: 1.5,
          color: CustomColors.dividerLine,
        ),
        SizedBox(height: 15),
        DetailBox(
          globalIndex: globalIndex,
          title: "Wind",
          description:
              "${widget.weatherDataDaily.daily[globalIndex].windSpeed}m/s NNE",
        ),
        DetailBox(
          globalIndex: globalIndex,
          title: "Pressure",
          description:
              "${widget.weatherDataDaily.daily[globalIndex].pressure}hPa",
        ),
        DetailBox(
          globalIndex: globalIndex,
          title: "Humidity",
          description:
              "${widget.weatherDataDaily.daily[globalIndex].humidity}%",
        ),
        DetailBox(
          globalIndex: globalIndex,
          title: "UV index",
          description: "${widget.weatherDataDaily.daily[globalIndex].uvi}",
        ),
        DetailBox(
          globalIndex: globalIndex,
          title: "Sunrise",
          description:
              "${getTime(widget.weatherDataDaily.daily[globalIndex].sunrise)}",
        ),
        DetailBox(
          globalIndex: globalIndex,
          title: "Sunset",
          description:
              "${getTime(widget.weatherDataDaily.daily[globalIndex].sunset)}",
        ),
      ],
    );
  }
}

class DetailBox extends StatelessWidget {
  const DetailBox({
    super.key,
    required this.globalIndex,
    required this.title,
    required this.description,
  });

  final int globalIndex;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title),
              Text(
                description,
              ),
            ],
          ),
        ),
        Container(
          width: double.infinity,
          height: 1.5,
          color: CustomColors.dividerLine,
        ),
      ],
    );
  }
}
