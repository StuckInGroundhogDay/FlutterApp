class DayTemperature {
  static const int defaultAverageTemperature = 20;
  static const int defaultMaxTemperature = 20;
  static const int defaultMinTemperature = 20;

  int averageTemperature;
  int maxTemperature;
  int minTemperature;

  DayTemperature({
    required this.averageTemperature,
    required this.minTemperature,
    required this.maxTemperature,
  });
}
