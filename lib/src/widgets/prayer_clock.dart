import 'package:flutter/material.dart';
import 'package:mosque_timings/src/mvc/models/mosque_timings.dart';

class PrayerClock extends StatelessWidget {
  const PrayerClock({Key? key, this.prayer}) : super(key: key);

  final Prayer? prayer;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 3,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(prayer?.name ?? '', style: Theme.of(context).textTheme.headline5,),
          ),
        ),
        Flexible(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(prayer?.time?.format(context) ?? '', style: Theme.of(context).textTheme.headline5),
          ),
        ),
      ],
    );
  }
}
