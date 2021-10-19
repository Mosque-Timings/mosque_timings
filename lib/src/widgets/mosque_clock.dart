import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:mosque_timings/src/mvc/controllers/mosque_timings_controller.dart';
import 'package:mosque_timings/src/widgets/prayer_clock.dart';

class MosqueClock extends StatelessWidget {
  MosqueClock({Key? key}) : super(key: key);

  final MosqueTimingsController _mosqueTimingsController =
      Get.put(MosqueTimingsController());
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GetBuilder<MosqueTimingsController>(builder: (_controller) {
            return Text(
              _controller.mosqueTimings[_controller.mosqueIndex.value].name ??
                  '',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline5,
            );
          }),
        ),
        Expanded(
          flex: 2,
          child: PageView.builder(
              onPageChanged: (pageIndex) {
                _mosqueTimingsController.changeIndex(pageIndex);
              },
              itemCount: _mosqueTimingsController.mosqueTimings.length,
              itemBuilder: (context, pageIndex) {
                return GetBuilder<MosqueTimingsController>(
                    builder: (_controller) => Container(
                        alignment: Alignment.center,
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
                              offset: const Offset(
                                  0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: _controller.mosqueTimings[pageIndex]
                                .getPrayerList()
                                .length,
                            itemBuilder: (_, index) {
                              return PrayerClock(
                                index: index,
                                prayer: _controller.mosqueTimings[pageIndex]
                                    .getPrayerList()[index],
                              );
                            })));
              }),
        ),
        const Expanded(flex: 1, child: SizedBox()),
      ],
    );
  }
}
