import 'package:mudawah/models/facibility_models/work_day.dart';

class Time {
  var startHours;
  var startMinuts;
  var endHours;
  var endMinuts;
  late Periods period;
  Time({required this.period});

  convertTimeToInteger() {
    String HourtimeFrom = period.fromTime!.substring(0, 2);
    startHours = int.parse(HourtimeFrom);
    print('startHours${startHours}');
    String MinutstimeFrom = period.fromTime!.substring(3, 5);
    startMinuts = int.parse(MinutstimeFrom);
    //final from = TimeOfDay(hour: intHourTimeFrom, minute: intMinutsTimeFrom);
    print('startMinuts${startMinuts}');

    String HourtimeTo = period.toTime!.substring(0, 2);
    endHours = int.parse(HourtimeTo);
    print('endHours${endHours}');
    String MinutstimeTo = period.toTime!.substring(3, 5);
    endMinuts = int.parse(MinutstimeTo);
    print('endMinuts${endMinuts}');
  }
}
