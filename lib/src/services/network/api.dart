import 'dart:convert';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:mosque_timings/src/constant/app_constants.dart';
import 'package:mosque_timings/src/mvc/models/mosque_timings.dart';

class API {
  final url = localHostUrlAndroid;
  final newMosque = 'new/';
  final all = 'all/';
  final mosqueTimings = 'mosque-timings/';
  final update = 'update/';
  final userLocations = 'user-locations/';

  Future<Response> getMosqueTimings(String token) async {

    final response =
        await post(Uri.parse(url + userLocations + "?token=$token"));
    return response;
  }

  getAll() async {
    final response = await get(Uri.parse(url + all));
    return response;
  }

  getUserLocations(String token) async{
    final response = await get(Uri.parse(url + userLocations + "?token=$token"));
    return response;
  }

  Future<Response> updateMosqueTimings(MosqueTimings mosqueTimings) async {

    final response = await put(Uri.parse(url + update),
        body: jsonEncode({
          "location": mosqueTimings.location,
          "updated": mosqueTimings.updated.toString(),
          "fajr": DateFormat("HH:mm").format(mosqueTimings.fajr!),
          "name": mosqueTimings.name,
          "asr": DateFormat("HH:mm").format(mosqueTimings.asr!),
          "isha": DateFormat("HH:mm").format(mosqueTimings.isha!),
          "duhr": DateFormat("HH:mm").format(mosqueTimings.duhr!),
          "maghrib": DateFormat("HH:mm").format(mosqueTimings.maghrib!),
          "friday": DateFormat("HH:mm").format(mosqueTimings.friday!)
        }));

    return response;
  }
}
