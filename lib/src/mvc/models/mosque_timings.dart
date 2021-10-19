
import 'package:intl/intl.dart';

class MosqueTimings {
  String? location, name;
  DateTime? updated;
  DateTime? fajr, duhr, asr, maghrib, isha, friday;

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
      fajr: DateFormat("hh:mm:ss").parse(json['fajr']),
      duhr: DateFormat("hh:mm:ss").parse(json['duhr']),
      asr: DateFormat("hh:mm:ss").parse(json['asr']),
      maghrib: DateFormat("hh:mm:ss").parse(json['maghrib']),
      isha: DateFormat("hh:mm:ss").parse(json['isha']),
      friday: DateFormat("hh:mm:ss").parse(json['friday']),
    );
  }
}

class Prayer {
  String? name;
  DateTime? time;

  Prayer({this.name, this.time});
}
