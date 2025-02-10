import 'package:flutter/material.dart';
import 'package:mudawah/models/facibility_models/work_day.dart';

import '../../../others/size_config.dart';
import 'package:intl/intl.dart' as intl;

class WorkTimeCard extends StatelessWidget {
  WorkTimeCard({Key? key, required this.workDay}) : super(key: key);
  final WorkDays workDay;
  final f = new intl.DateFormat('hh:mm');

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizeConfig.screenWidth * .3,
      height: SizeConfig.screenHeight * .1,
      child: Card(
        color: Color(0xff97CCD8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(SizeConfig.screenWidth * .03),
        ),
        child: Column(children: [
          Text(workDay.name!),
          Container(
            width: SizeConfig.screenWidth * .4,
            height: SizeConfig.screenHeight * .001,
            color: Colors.grey,
          ),
          (workDay.periods != null)
              ? SizedBox(
                  width: SizeConfig.screenWidth * .3,
                  height: SizeConfig.screenHeight * .07,
                  child: ListView.builder(
                      itemCount: workDay.periods!.length,
                      itemBuilder: (context, index) {
                        return periodCard(workDay.periods![index]);
                      }),
                )
              : Container()
        ]),
      ),
    );
  }

  Widget periodCard(Periods period) {
    String timeFrom = period.fromTime!.substring(0, 5);
    String timeTo = period.fromTime!.substring(0, 5);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(timeFrom.toString()),
        SizedBox(
          width: SizeConfig.screenWidth * .08,
        ),
        Text(timeTo.toString()),
      ],
    );
  }
}
