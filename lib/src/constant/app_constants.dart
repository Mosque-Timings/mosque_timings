import 'package:intl/intl.dart';

final sqlDateFormatter = DateFormat('yyyy-MM-dd');
final displayDateFormatter = DateFormat('MMM, dd');
final port = '8000';
final localHost = '127.0.0.1';
final remoteHost = '192.168.10.29';
final localHostAndroid = '10.0.2.2';
final localHostUrl = 'http://$localHost:$port/';
final remoteHostUrl = 'http://$remoteHost:$port/';
final localHostUrlAndroid = 'http://$localHostAndroid:$port/';
final localHostWebSocketUrl = 'ws://$localHost:$port/';
final remoteHosWebSocketUrl = 'ws://$remoteHost:$port';
final localHostWebSocketUrlAndroid = 'ws://$localHostAndroid:$port/';

