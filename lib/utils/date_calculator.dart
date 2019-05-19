import 'package:date_format/date_format.dart';

class DateCalculator {

  static String buildDateTime(int timeStamp) {
      return formatDate(new DateTime.fromMillisecondsSinceEpoch(timeStamp), [yyyy, '-', MM, '-', dd, ', ', hh, ':', mm]);
  }
}