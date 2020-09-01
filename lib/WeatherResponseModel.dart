// To parse this JSON data, do
//
//     final weatherResponseModel = weatherResponseModelFromMap(jsonString);

import 'dart:convert';

WeatherResponseModel weatherResponseModelFromMap(String str) =>
    WeatherResponseModel.fromMap(json.decode(str));

String weatherResponseModelToMap(WeatherResponseModel data) =>
    json.encode(data.toMap());

class WeatherResponseModel {
  WeatherResponseModel({
    this.address,
    this.lat,
    this.lon,
    this.forecast,
  });

  String address;
  double lat;
  double lon;
  List<Forecast> forecast;

  factory WeatherResponseModel.fromMap(Map<String, dynamic> json) =>
      WeatherResponseModel(
        address: json["address"] == null ? null : json["address"],
        lat: json["lat"] == null ? null : json["lat"].toDouble(),
        lon: json["lon"] == null ? null : json["lon"].toDouble(),
        forecast: json["forecast"] == null
            ? null
            : List<Forecast>.from(
                json["forecast"].map((x) => Forecast.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "address": address == null ? null : address,
        "lat": lat == null ? null : lat,
        "lon": lon == null ? null : lon,
        "forecast": forecast == null
            ? null
            : List<dynamic>.from(forecast.map((x) => x.toMap())),
      };
}

class Forecast {
  Forecast({
    this.date,
    this.sunrise,
    this.sunset,
    this.moonrise,
    this.moonset,
    this.moonillumination,
    this.cloudcover,
  });

  String date;
  String sunrise;
  String sunset;
  String moonrise;
  String moonset;
  String moonillumination;
  List<Cloudcover> cloudcover;

  factory Forecast.fromMap(Map<String, dynamic> json) => Forecast(
        date: json["date"] == null ? null : json["date"],
        sunrise: json["sunrise"] == null ? null : json["sunrise"],
        sunset: json["sunset"] == null ? null : json["sunset"],
        moonrise: json["moonrise"] == null ? null : json["moonrise"],
        moonset: json["moonset"] == null ? null : json["moonset"],
        moonillumination:
            json["moonillumination"] == null ? null : json["moonillumination"],
        cloudcover: json["cloudcover"] == null
            ? null
            : List<Cloudcover>.from(
                json["cloudcover"].map((x) => Cloudcover.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "date": date == null ? null : date,
        "sunrise": sunrise == null ? null : sunrise,
        "sunset": sunset == null ? null : sunset,
        "moonrise": moonrise == null ? null : moonrise,
        "moonset": moonset == null ? null : moonset,
        "moonillumination": moonillumination == null ? null : moonillumination,
        "cloudcover": cloudcover == null
            ? null
            : List<dynamic>.from(cloudcover.map((x) => x.toMap())),
      };
}

class Cloudcover {
  Cloudcover({
    this.time,
    this.cover,
  });

  String time;
  int cover;

  factory Cloudcover.fromMap(Map<String, dynamic> json) => Cloudcover(
        time: json["time"] == null ? null : json["time"],
        cover: json["cover"] == null ? null : json["cover"],
      );

  Map<String, dynamic> toMap() => {
        "time": time == null ? null : time,
        "cover": cover == null ? null : cover,
      };
}
