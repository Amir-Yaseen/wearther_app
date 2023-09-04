class WeatherModel {
  Location? location;
  CurrentWeather? currentWeather;
  Forecast? forecast;


  WeatherModel({this.location,this.forecast});

  WeatherModel.fromJson(Map<String, dynamic> json) {
    location = json['location'] != null
        ? Location.fromJson(json['location'])
        : null;
    currentWeather = json['current'] !=null
    ? CurrentWeather.fromJson(json['current']):null;
    forecast = json['forecast'] != null
        ? Forecast.fromJson(json['forecast'])
        : null;
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = <String, dynamic>{};
  //   if (location != null) {
  //     data['location'] = location!.toJson();
  //   }
  //   if (forecast != null) {
  //     data['forecast'] = forecast!.toJson();
  //   }
  //   return data;
  // }
}

class Location {
  String? name;
  String? country;
  String? localtime;

  Location(
      {this.name,
      this.country,
      this.localtime});

  Location.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    country = json['country'];
    localtime = json['localtime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['country'] = country;
    data['localtime'] = localtime;
    return data;
  }
}



class Condition {
  String? text;
  String? icon;
  int? code;

  Condition({this.text, this.icon, this.code});

  Condition.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    icon = json['icon'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['text'] = text;
    data['icon'] = icon;
    data['code'] = code;
    return data;
  }
}

class Forecast {
  List<Forecastday>? forecastday;

  Forecast({this.forecastday});

  Forecast.fromJson(Map<String, dynamic> json) {
    if (json['forecastday'] != null) {
      forecastday = <Forecastday>[];
      json['forecastday'].forEach((v) {
        forecastday!.add(Forecastday.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (forecastday != null) {
      data['forecastday'] = forecastday!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CurrentWeather {
  String? lastUpdated;
  double? tempC;
  int? isDay;
  Condition? condition;
  double? windKph;
  double? pressureMb;
  double? pressureIn;
  int? humidity;
  double? feelslikeC;
  double? uv;

  CurrentWeather(
      {
      this.lastUpdated,
      this.tempC,
      this.isDay,
      this.condition,
      this.windKph,
      this.pressureMb,
      this.pressureIn,
      this.humidity,
      this.feelslikeC,
      this.uv,
      });

  CurrentWeather.fromJson(Map<String, dynamic> json) {
    lastUpdated = json['last_updated'];
    tempC = json['temp_c'];
    isDay = json['is_day'];
    condition = json['condition'] != null
        ? Condition.fromJson(json['condition'])
        : null;
    windKph = json['wind_kph'];
    pressureMb = json['pressure_mb'];
    pressureIn = json['pressure_in'];
    humidity = json['humidity'];
    feelslikeC = json['feelslike_c'];
    uv = json['uv'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['last_updated'] = lastUpdated;
    data['temp_c'] = tempC;
    data['is_day'] = isDay;
    if (condition != null) {
      data['condition'] = condition!.toJson();
    }
    data['wind_kph'] = windKph;
    data['pressure_mb'] = pressureMb;
    data['pressure_in'] = pressureIn;
    data['humidity'] = humidity;
    data['feelslike_c'] = feelslikeC;
    data['uv'] = uv;
    return data;
  }
}



class Forecastday {
  String? date;
 
  Day? day;
  Astro? astro;
  List<Hour>? hour;
  

  Forecastday({
    this.date,
    
    this.day, 
    this.astro, 
    this.hour});

  Forecastday.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    // time = json['time'];
    day = json['day'] != null ? Day.fromJson(json['day']) : null;
    astro = json['astro'] != null ? Astro.fromJson(json['astro']) : null;
    if (json['hour'] != null) {
      hour = <Hour>[];
      json['hour'].forEach((v) {
        hour!.add(Hour.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['date'] = date;
    // data['time'] = time;
    if (day != null) {
      data['day'] = day!.toJson();
    }
    if (astro != null) {
      data['astro'] = astro!.toJson();
    }
    if (hour != null) {
      data['hour'] = hour!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Day {
  double? maxtempC;
  double? mintempC;
  double? avgtempC;
  double? maxwindKph;
  int? dailyChanceOfRain;
  int? dailyChanceOfSnow;
  Condition? condition;
  double? uv;
  double? humidity;

  Day(
      {this.maxtempC,
      this.mintempC,
      this.avgtempC,
      this.maxwindKph,
      this.dailyChanceOfRain,
      this.dailyChanceOfSnow,
      this.condition,
      this.uv,
      this.humidity,
      });

  Day.fromJson(Map<String, dynamic> json) {
    maxtempC = json['maxtemp_c'];
    mintempC = json['mintemp_c'];
    avgtempC = json['avgtemp_c'];
    humidity = json['avghumidity'];
    maxwindKph = json['maxwind_kph'];
    dailyChanceOfRain = json['daily_chance_of_rain'];
    dailyChanceOfSnow = json['daily_chance_of_snow'];
    condition = json['condition'] != null
        ? Condition.fromJson(json['condition'])
        : null;
    uv = json['uv'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['maxtemp_c'] = maxtempC;
    data['mintemp_c'] = mintempC;
    data['avgtemp_c'] = avgtempC;
    data['avghumidity'] = humidity;
    data['maxwind_kph'] = maxwindKph;
    data['daily_chance_of_rain'] = dailyChanceOfRain;
    data['daily_chance_of_snow'] = dailyChanceOfSnow;
    if (condition != null) {
      data['condition'] = condition!.toJson();
    }
    data['uv'] = uv;
    return data;
  }
}

class Astro {
  String? sunrise;
  String? sunset;

  Astro(
      {this.sunrise,
      this.sunset,
      });

  Astro.fromJson(Map<String, dynamic> json) {
    sunrise = json['sunrise'];
    sunset = json['sunset'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['sunrise'] = sunrise;
    data['sunset'] = sunset;
    return data;
  }
}

class Hour {
  String? time;
  double? tempC;
  int? isDay;
  Condition? condition;
  double? pressure;
  int? chanceOfRain;

  Hour(
      {
   
      this.time,
      this.tempC,
      this.pressure,
      this.isDay,
      this.condition,
      required this.chanceOfRain
     
      });

  Hour.fromJson(Map<String, dynamic> json) {
    // timeEpoch = json['time_epoch'];
    time = json['time'];
    tempC = json['temp_c'];
    pressure = json['pressure_in'];
    isDay = json['is_day'];
    condition = json['condition'] != null
        ? Condition.fromJson(json['condition'])
        : null;
    chanceOfRain = json['chance_of_rain'];
    
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    // data['time_epoch'] = timeEpoch;
    data['time'] = time;
    data['temp_c'] = tempC;
    data['pressure_in'] = pressure;
    data['is_day'] = isDay;
    data['chance_of_rain'] = chanceOfRain;
    if (condition != null) {
      data['condition'] = condition!.toJson();
    }
    
    return data;
  }
}

