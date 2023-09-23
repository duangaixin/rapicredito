import 'package:rapicredito/widget/pickers/time_picker/model/date_type.dart';

class Suffix {
  late String years;
  late String month;
  late String days;
  late String hours;
  late String minutes;
  late String seconds;

  Suffix.normal() {
    years = '年';
    month = '月';
    days = '日';
    hours = '时';
    minutes = '分';
    seconds = '秒';
  }

  Suffix(
      {this.years = '',
      this.month = '',
      this.days = '',
      this.hours = '',
      this.minutes = '',
      this.seconds = ''});

  String getSingle(DateType dateType) {
    switch (dateType) {
      case DateType.Year:
        return years;
      case DateType.Month:
        return month;
      case DateType.Day:
        return days;
      case DateType.Hour:
        return hours;
      case DateType.Minute:
        return minutes;
      case DateType.Second:
        return seconds;
    }
  }
}
