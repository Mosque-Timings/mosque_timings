import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mosque_timings/src/mvc/models/mosque_timings.dart';
import 'package:mosque_timings/src/services/network/api.dart';

class MosqueTimingsController extends GetxController {
  final RxList<MosqueTimings> mosqueTimings = [MosqueTimings()].obs;
  final mosqueIndex = 0.obs;

  MosqueTimingsController() {
    loadMosqueTimings();
  }

  loadMosqueTimings() async {
    final locations = await API().getUserLocations(
        "cLexA7DEQNW6Ux9hLxc8u4:APA91bE_-2VPbMFS2DgLGQ-RgWA4ZMfd9kfMr5p4zI55MRbAwaUstdbUrgJ2wlcGQ9nvSQ-DijzRcl7piO0uGUUmBNX2rifu_ehKMZjYiv8tK_i4FYweNtFJIGD24fmEjgPk-iGYpUCz");
    mosqueTimings.value = mosqueTimingsFromJson(locations);
  }

  changeIndex(pageIndex) {
    mosqueIndex.value = pageIndex;
    update();
  }

  List<MosqueTimings> mosqueTimingsFromJson(response) {
    return (json.decode(response.body) as List)
        .map((data) => MosqueTimings.fromJson(data))
        .toList();
  }

  updateMosqueTimings() async {
    final response =
        await API().updateMosqueTimings(mosqueTimings[mosqueIndex.value]);
    if (response.statusCode == 200) {
      Get.snackbar('Successful', "Mosque timings updated!");
    }
  }

  pickTime(index) async {
    final TimeOfDay newTime =
        await Get.dialog(TimePickerDialog(initialTime: TimeOfDay.now()));

    final now = DateTime.now();
    final time =
        DateTime(now.year, now.month, now.day, newTime.hour, newTime.minute);
    switch (index) {
      case 0:
        mosqueTimings[mosqueIndex.value].fajr = time;
        break;

      case 1:
        mosqueTimings[mosqueIndex.value].duhr = time;
        break;

      case 2:
        mosqueTimings[mosqueIndex.value].asr = time;
        break;

      case 3:
        mosqueTimings[mosqueIndex.value].maghrib = time;
        break;

      case 4:
        mosqueTimings[mosqueIndex.value].isha = time;
        break;

      case 5:
        mosqueTimings[mosqueIndex.value].friday = time;
        break;
      default:
    }
    update();
    await updateMosqueTimings();
  }
}
