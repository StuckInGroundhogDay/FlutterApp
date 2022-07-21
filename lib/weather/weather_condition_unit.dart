//import 'dart:io';
//import 'dart:convert';

class WeatherConditionUnit {
  int id;
  String condition;
  String description;
  late String path;

  WeatherConditionUnit({
    required this.id,
    required this.condition,
    required this.description,
  }) {
    getImagePathById();
  }

  Future getImagePathById() async {
    //final json = jsonDecode(
    //    await File("assets/json/weather_conditions.json").readAsString());
    //
    //print(json);

    path = "assets/images/${pathById[id.toString()] as String}";
  }

  //TODO ИСПРАВИТЬ КОСТЫЛЬ - ВМЕСТО ПРОЧТЕНИЯ Map<String, String> НУЖНО ЧИТАТЬ JSON ФАЙЛ
  static Map<String, String> pathById = {
    "200": "thunderstorm.svg",
    "201": "thunderstorm.svg",
    "202": "thunderstorm.svg",
    "210": "thunderstorm.svg",
    "211": "thunderstorm.svg",
    "212": "thunderstorm.svg",
    "221": "thunderstorm.svg",
    "230": "thunderstorm.svg",
    "231": "thunderstorm.svg",
    "232": "thunderstorm.svg",
    "300": "shower_rain.svg",
    "301": "shower_rain.svg",
    "302": "shower_rain.svg",
    "310": "shower_rain.svg",
    "311": "shower_rain.svg",
    "312": "shower_rain.svg",
    "313": "shower_rain.svg",
    "314": "shower_rain.svg",
    "321": "shower_rain.svg",
    "500": "rain.svg",
    "501": "rain.svg",
    "502": "rain.svg",
    "503": "rain.svg",
    "504": "rain.svg",
    "511": "snow.svg",
    "520": "shower_rain.svg",
    "521": "shower_rain.svg",
    "522": "shower_rain.svg",
    "531": "shower_rain.svg",
    "600": "snow.svg",
    "601": "snow.svg",
    "602": "snow.svg",
    "611": "snow.svg",
    "612": "snow.svg",
    "613": "snow.svg",
    "615": "snow.svg",
    "616": "snow.svg",
    "620": "snow.svg",
    "621": "snow.svg",
    "622": "snow.svg",
    "701": "mist.svg",
    "711": "mist.svg",
    "721": "mist.svg",
    "731": "mist.svg",
    "741": "mist.svg",
    "751": "mist.svg",
    "761": "mist.svg",
    "762": "mist.svg",
    "771": "mist.svg",
    "781": "mist.svg",
    "800": "clear_sky.svg",
    "801": "few_clouds.svg",
    "802": "scattered_clouds.svg",
    "803": "broken_clouds.svg",
    "804": "broken_clouds.svg"
  };
}
