class Weather {
  Location? location;
  Current? current;

  Weather({this.location, this.current});

  Weather.fromJson(Map<String, dynamic> json) {
    location = json["location"] != null ? Location.fromJson(json["location"]) : null;
    current = json["current"] != null ? Current.fromJson(json["current"]) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (location != null) data["location"] = location!.toJson();
    if (current != null) data["current"] = current!.toJson();
    return data;
  }

  @override
  String toString() => 'Weather(location: $location, current: $current)';
}

class Location {
  String? name;
  String? region;
  String? country;
  double? lat;
  double? lon;
  String? tzId;
  int? localtimeEpoch;
  String? localtime;

  Location({
    this.name,
    this.region,
    this.country,
    this.lat,
    this.lon,
    this.tzId,
    this.localtimeEpoch,
    this.localtime,
  });

  Location.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    region = json["region"];
    country = json["country"];
    lat = (json["lat"] ?? 0).toDouble();
    lon = (json["lon"] ?? 0).toDouble();
    tzId = json["tz_id"];
    localtimeEpoch = json["localtime_epoch"];
    localtime = json["localtime"];
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "region": region,
        "country": country,
        "lat": lat,
        "lon": lon,
        "tz_id": tzId,
        "localtime_epoch": localtimeEpoch,
        "localtime": localtime,
      };

  @override
  String toString() => 'Location(name: $name, country: $country, localtime: $localtime)';
}

class Current {
  int? lastUpdatedEpoch;
  String? lastUpdated;
  double? tempC;
  double? tempF;
  bool? isDay;
  Condition? condition;

  double? windMph;
  double? windKph;
  int? windDegree;
  String? windDir;

  double? pressureMb;
  double? pressureIn;

  double? precipMm;
  double? precipIn;

  int? humidity;
  int? cloud;

  double? feelslikeC;
  double? feelslikeF;

  double? windchillC;
  double? windchillF;

  double? heatindexC;
  double? heatindexF;

  double? dewpointC;
  double? dewpointF;

  double? visKm;
  double? visMiles;

  double? uv;

  double? gustMph;
  double? gustKph;

  Current({
    this.lastUpdatedEpoch,
    this.lastUpdated,
    this.tempC,
    this.tempF,
    this.isDay,
    this.condition,
    this.windMph,
    this.windKph,
    this.windDegree,
    this.windDir,
    this.pressureMb,
    this.pressureIn,
    this.precipMm,
    this.precipIn,
    this.humidity,
    this.cloud,
    this.feelslikeC,
    this.feelslikeF,
    this.windchillC,
    this.windchillF,
    this.heatindexC,
    this.heatindexF,
    this.dewpointC,
    this.dewpointF,
    this.visKm,
    this.visMiles,
    this.uv,
    this.gustMph,
    this.gustKph,
  });

  Current.fromJson(Map<String, dynamic> json) {
    lastUpdatedEpoch = json["last_updated_epoch"];
    lastUpdated = json["last_updated"];
    tempC = (json["temp_c"] ?? 0).toDouble();
    tempF = (json["temp_f"] ?? 0).toDouble();
    isDay = json["is_day"] == 1;
    condition = json["condition"] != null ? Condition.fromJson(json["condition"]) : null;

    windMph = (json["wind_mph"] ?? 0).toDouble();
    windKph = (json["wind_kph"] ?? 0).toDouble();
    windDegree = json["wind_degree"];
    windDir = json["wind_dir"];

    pressureMb = (json["pressure_mb"] ?? 0).toDouble();
    pressureIn = (json["pressure_in"] ?? 0).toDouble();

    precipMm = (json["precip_mm"] ?? 0).toDouble();
    precipIn = (json["precip_in"] ?? 0).toDouble();

    humidity = json["humidity"];
    cloud = json["cloud"];

    feelslikeC = (json["feelslike_c"] ?? 0).toDouble();
    feelslikeF = (json["feelslike_f"] ?? 0).toDouble();

    windchillC = (json["windchill_c"] ?? 0).toDouble();
    windchillF = (json["windchill_f"] ?? 0).toDouble();

    heatindexC = (json["heatindex_c"] ?? 0).toDouble();
    heatindexF = (json["heatindex_f"] ?? 0).toDouble();

    dewpointC = (json["dewpoint_c"] ?? 0).toDouble();
    dewpointF = (json["dewpoint_f"] ?? 0).toDouble();

    visKm = (json["vis_km"] ?? 0).toDouble();
    visMiles = (json["vis_miles"] ?? 0).toDouble();

    uv = (json["uv"] ?? 0).toDouble();

    gustMph = (json["gust_mph"] ?? 0).toDouble();
    gustKph = (json["gust_kph"] ?? 0).toDouble();
  }

  Map<String, dynamic> toJson() => {
        "last_updated_epoch": lastUpdatedEpoch,
        "last_updated": lastUpdated,
        "temp_c": tempC,
        "temp_f": tempF,
        "is_day": isDay == true ? 1 : 0,
        "condition": condition?.toJson(),
        "wind_mph": windMph,
        "wind_kph": windKph,
        "wind_degree": windDegree,
        "wind_dir": windDir,
        "pressure_mb": pressureMb,
        "pressure_in": pressureIn,
        "precip_mm": precipMm,
        "precip_in": precipIn,
        "humidity": humidity,
        "cloud": cloud,
        "feelslike_c": feelslikeC,
        "feelslike_f": feelslikeF,
        "windchill_c": windchillC,
        "windchill_f": windchillF,
        "heatindex_c": heatindexC,
        "heatindex_f": heatindexF,
        "dewpoint_c": dewpointC,
        "dewpoint_f": dewpointF,
        "vis_km": visKm,
        "vis_miles": visMiles,
        "uv": uv,
        "gust_mph": gustMph,
        "gust_kph": gustKph,
      };

  @override
  String toString() => 'Current(tempC: $tempC, tempF: $tempF, condition: $condition)';
}

class Condition {
  String? text;
  String? icon;
  int? code;

  Condition({this.text, this.icon, this.code});

  Condition.fromJson(Map<String, dynamic> json) {
    text = json["text"];
    icon = json["icon"];
    code = json["code"];
  }

  Map<String, dynamic> toJson() => {
        "text": text,
        "icon": icon,
        "code": code,
      };

  @override
  String toString() => 'Condition(text: $text, icon: $icon, code: $code)';
}
