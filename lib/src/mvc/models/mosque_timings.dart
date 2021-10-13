import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MosqueTimings {
  final String? location, name;
  final DateTime? updated;
  final TimeOfDay? fajr, duhr, asr, maghrib, isha, friday;

  MosqueTimings(
      {this.location,
      this.name,
      this.updated,
      this.fajr,
      this.duhr,
      this.asr,
      this.maghrib,
      this.isha,
      this.friday});

  getPrayerList() {
    return [
      Prayer(name: 'Fajr', time: fajr),
      Prayer(name: 'Duhr', time: duhr),
      Prayer(name: 'Asr', time: asr),
      Prayer(name: 'Maghrib', time: maghrib),
      Prayer(name: 'Isha', time: isha),
      Prayer(name: 'Friday', time: friday),
    ];
  }

  factory MosqueTimings.fromJson(json) {
    return MosqueTimings(
      location: json['location'],
      name: json['name'],
      updated: DateTime.parse(json['updated']),
      fajr: TimeOfDay.fromDateTime(DateFormat("hh:mm:ss").parse(json['fajr'])),
      duhr: TimeOfDay.fromDateTime(DateFormat("hh:mm:ss").parse(json['duhr'])),
      asr: TimeOfDay.fromDateTime(DateFormat("hh:mm:ss").parse(json['asr'])),
      maghrib: TimeOfDay.fromDateTime(DateFormat("hh:mm:ss").parse(json['maghrib'])),
      isha: TimeOfDay.fromDateTime(DateFormat("hh:mm:ss").parse(json['isha'])),
      friday: TimeOfDay.fromDateTime(DateFormat("hh:mm:ss").parse(json['friday'])),
    );
  }
}

class Prayer {
  String? name;
  TimeOfDay? time;

  Prayer({this.name, this.time});
}
