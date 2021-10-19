import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mosque_timings/src/mvc/controllers/mosque_timings_controller.dart';
import 'package:mosque_timings/src/mvc/models/mosque_timings.dart';

class PrayerClock extends StatelessWidget {
  PrayerClock({Key? key, this.prayer, this.index}) : super(key: key);

  final Prayer? prayer;
  final int? index;
  final MosqueTimingsController _mosqueTimingsController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            prayer?.name!.tr ?? '',
            style: Theme.of(context).textTheme.headline5,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
                onPressed: () {
                  _mosqueTimingsController.pickTime(index);
                },
                icon: const Icon(Icons.access_time)),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                  DateFormat.jm().format(prayer?.time ?? DateTime.now()).tr,
                  style: Theme.of(context).textTheme.headline5),
            ),
          ],
        )
      ],
    );
  }
}
