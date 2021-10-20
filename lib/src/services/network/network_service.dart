import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:mosque_timings/src/constant/app_constants.dart';
import 'package:mosque_timings/src/mvc/models/mosque_timings.dart';

abstract class MosqueTimingsAPI {
  Future<http.Response> getMosqueTimings(String token);
  Future<http.Response> getAllMosques();
  Future<http.Response> getUserLocations(String token);
  Future<http.Response> updateMosqueTimings(MosqueTimings mosqueTimings);
}

abstract class GoogleMapAPI {
  // Google Map API integration
}

class NetworkService implements MosqueTimingsAPI {
  final url = GetPlatform.isAndroid ? localHostUrlAndroid : localHostUrl;
  final newMosque = 'new/';
  final all = 'all/';
  final mosqueTimings = 'mosque-timings/';
  final update = 'update/';
  final userLocations = 'user-locations/';

  @override
  Future<http.Response> getMosqueTimings(String token) async {
    final response =
        await http.post(Uri.parse(url + userLocations + "?token=$token"));
    return response;
  }

  @override
  Future<http.Response> getAllMosques() async {
    final response = await http.get(Uri.parse(url + all));
    return response;
  }

  @override
  Future<http.Response> getUserLocations(String token) async {
    final response =
        await http.get(Uri.parse(url + userLocations + "?token=$token"));
    return response;
  }

  @override
  Future<http.Response> updateMosqueTimings(MosqueTimings mosqueTimings) async {
    final response = await http.put(Uri.parse(url + update),
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
