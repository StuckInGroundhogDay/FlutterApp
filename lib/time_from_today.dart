import 'package:jiffy/jiffy.dart';

class TimeFromToday {
  static String getDayOfWeek(int index) {
    return Jiffy().add(days: index).E;
  }

  static String getDate(int index) {
    return Jiffy().add(days: index).MMMd;
  }
}
