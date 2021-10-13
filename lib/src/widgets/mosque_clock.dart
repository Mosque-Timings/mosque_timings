import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mosque_timings/src/mvc/controllers/mosque_timings_controller.dart';
import 'package:mosque_timings/src/mvc/models/mosque_timings.dart';
import 'package:mosque_timings/src/widgets/prayer_clock.dart';

class MosqueClock extends StatelessWidget {
  MosqueClock({Key? key, this.mosqueTimings}) : super(key: key);
  final MosqueTimings? mosqueTimings;

  final MosqueTimingsController _mosqueTimingsController =
      Get.put(MosqueTimingsController());
  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      alignment: WrapAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            _mosqueTimingsController.mosqueTimings.value.name ?? '',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline5,
          ),
        ),
        Obx(() => Container(
            margin: const EdgeInsets.all(12.0),
            padding: const EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _mosqueTimingsController.mosqueTimings.value
                    .getPrayerList()
                    .length,
                itemBuilder: (_, index) {
                  return GestureDetector(
                      onTap: () {
                        _mosqueTimingsController.pickTime(index);
                      },
                      child: PrayerClock(
                        prayer: _mosqueTimingsController.mosqueTimings.value
                            .getPrayerList()[index],
                      ));
                }))),
      ],
    );
  }
}
