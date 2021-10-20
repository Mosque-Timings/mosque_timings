import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mosque_timings/src/constant/app_constants.dart';
import 'package:mosque_timings/src/mvc/models/mosque_timings.dart';
import 'package:mosque_timings/src/services/network/network_service.dart';

class MosqueTimingsController extends GetxController {
  final RxList<MosqueTimings> mosqueTimings = [MosqueTimings()].obs;
  final mosqueIndex = 0.obs;

  MosqueTimingsController() {
    loadMosqueTimings();
  }

  loadMosqueTimings() async {
    final locations = await NetworkService().getUserLocations(token);
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
    final response = await NetworkService()
        .updateMosqueTimings(mosqueTimings[mosqueIndex.value]);
    if (response.statusCode == 200) {
      Get.snackbar('Successful', "Mosque timings updated!");
    }
  }

  pickTime(index) async {
    switch (index) {
      case 0:
        final dateTime = await timeCustom(
            TimeOfDay.fromDateTime(mosqueTimings[mosqueIndex.value].fajr!));
        mosqueTimings[mosqueIndex.value].fajr = dateTime;
        break;

      case 1:
        final dateTime = await timeCustom(
            TimeOfDay.fromDateTime(mosqueTimings[mosqueIndex.value].fajr!));
        mosqueTimings[mosqueIndex.value].duhr = dateTime;
        break;

      case 2:
        final dateTime = await timeCustom(
            TimeOfDay.fromDateTime(mosqueTimings[mosqueIndex.value].fajr!));
        mosqueTimings[mosqueIndex.value].asr = dateTime;
        break;

      case 3:
        final dateTime = await timeCustom(
            TimeOfDay.fromDateTime(mosqueTimings[mosqueIndex.value].fajr!));
        mosqueTimings[mosqueIndex.value].maghrib = dateTime;
        break;

      case 4:
        final dateTime = await timeCustom(
            TimeOfDay.fromDateTime(mosqueTimings[mosqueIndex.value].fajr!));
        mosqueTimings[mosqueIndex.value].isha = dateTime;
        break;

      case 5:
        final dateTime = await timeCustom(
            TimeOfDay.fromDateTime(mosqueTimings[mosqueIndex.value].fajr!));
        mosqueTimings[mosqueIndex.value].friday = dateTime;
        break;
      default:
    }
    update();
    await updateMosqueTimings();
  }

  Future<DateTime> timeCustom(timeOfPrayer) async {
    final TimeOfDay newTime =
        await Get.dialog(TimePickerDialog(initialTime: TimeOfDay.now()));

    final now = DateTime.now();

    return DateTime(now.year, now.month, now.day, newTime.hour, newTime.minute);
  }
}
