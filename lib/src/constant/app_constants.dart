import 'package:intl/intl.dart';

final sqlDateFormatter = DateFormat('yyyy-MM-dd');
final displayDateFormatter = DateFormat('MMM, dd');
const port = '8000';
const localHost = '127.0.0.1';
const remoteHost = '192.168.10.29';
const localHostAndroid = '10.0.2.2';
const localHostUrl = 'http://$localHost:$port/';
const remoteHostUrl = 'http://$remoteHost:$port/';
const localHostUrlAndroid = 'http://$localHostAndroid:$port/';
const localHostWebSocketUrl = 'ws://$localHost:$port/';
const remoteHosWebSocketUrl = 'ws://$remoteHost:$port';
const localHostWebSocketUrlAndroid = 'ws://$localHostAndroid:$port/';

