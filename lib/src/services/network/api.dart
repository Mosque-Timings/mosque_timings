import 'dart:convert';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:mosque_timings/src/constant/app_constants.dart';
import 'package:mosque_timings/src/mvc/models/mosque_timings.dart';

class API {
  final newMosque = 'new/';
  final all = 'all/';
  final mosqueTimings = 'mosque-timings/';
  final updateMosqueTimings = 'update/';

  Future<Response> getMosqueTimings(String location) async {
    final response = await get(Uri.parse(localHostUrl +
        mosqueTimings +
        "?location=$location"));
    print(response.body);
    return response;
  }

  getAll() async {
    final response = await get(Uri.parse(localHostUrl + all));
  }

  updateCheck(MosqueTimings mosqueTimings) async {
    final response = await put(Uri.parse(localHostUrl + updateMosqueTimings),
        body: jsonEncode({
          "location": mosqueTimings.location,
          "location": mosqueTimings.location,
          "fajr": DateFormat("HH:mm").format(DateFormat.jm().parse(mosqueTimings.fajr.toString())),
          "name": mosqueTimings.name,
          "asr": DateFormat("HH:mm").format(DateFormat.jm().parse(mosqueTimings.fajr.toString())),
          "isha": DateFormat("HH:mm").format(DateFormat.jm().parse(mosqueTimings.fajr.toString())),
          "duhr": DateFormat("HH:mm").format(DateFormat.jm().parse(mosqueTimings.fajr.toString())),
          "updated": DateFormat("HH:mm").format(DateFormat.jm().parse(mosqueTimings.fajr.toString())),
          "maghrib": DateFormat("HH:mm").format(DateFormat.jm().parse(mosqueTimings.fajr.toString())),
          "friday": DateFormat("HH:mm").format(DateFormat.jm().parse(mosqueTimings.fajr.toString()))
        }));

    return response;
  }
}
