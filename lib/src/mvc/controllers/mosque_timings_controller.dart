import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mosque_timings/src/mvc/models/mosque_timings.dart';
import 'package:mosque_timings/src/services/network/api.dart';

class MosqueTimingsController extends GetxController {
  final Rx<MosqueTimings> mosqueTimings = MosqueTimings().obs;

  MosqueTimingsController(){

    loadMosqueTimings();
  }

  loadMosqueTimings() async{

    final response = await API().getMosqueTimings("33.62840875269751, 73.12435709270113");
    mosqueTimings.value = MosqueTimings.fromJson(json.decode(response.body));
  }
  pickTime(index) async{
    final time = await Get.dialog(TimePickerDialog(initialTime: TimeOfDay.now()));


  }


}
