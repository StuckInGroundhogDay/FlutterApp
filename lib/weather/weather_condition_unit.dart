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
    "200": "thunderstorm.png",
    "201": "thunderstorm.png",
    "202": "thunderstorm.png",
    "210": "thunderstorm.png",
    "211": "thunderstorm.png",
    "212": "thunderstorm.png",
    "221": "thunderstorm.png",
    "230": "thunderstorm.png",
    "231": "thunderstorm.png",
    "232": "thunderstorm.png",
    "300": "shower_rain.png",
    "301": "shower_rain.png",
    "302": "shower_rain.png",
    "310": "shower_rain.png",
    "311": "shower_rain.png",
    "312": "shower_rain.png",
    "313": "shower_rain.png",
    "314": "shower_rain.png",
    "321": "shower_rain.png",
    "500": "rain.png",
    "501": "rain.png",
    "502": "rain.png",
    "503": "rain.png",
    "504": "rain.png",
    "511": "snow.png",
    "520": "shower_rain.png",
    "521": "shower_rain.png",
    "522": "shower_rain.png",
    "531": "shower_rain.png",
    "600": "snow.png",
    "601": "snow.png",
    "602": "snow.png",
    "611": "snow.png",
    "612": "snow.png",
    "613": "snow.png",
    "615": "snow.png",
    "616": "snow.png",
    "620": "snow.png",
    "621": "snow.png",
    "622": "snow.png",
    "701": "mist.png",
    "711": "mist.png",
    "721": "mist.png",
    "731": "mist.png",
    "741": "mist.png",
    "751": "mist.png",
    "761": "mist.png",
    "762": "mist.png",
    "771": "mist.png",
    "781": "mist.png",
    "800": "clear_sky.png",
    "801": "few_clouds.png",
    "802": "scattered_clouds.png",
    "803": "broken_clouds.png",
    "804": "broken_clouds.png"
  };
}
