import 'package:get/get.dart';
import 'package:mosque_timings/src/config/routes/routes.dart';
import 'package:mosque_timings/src/mvc/views/home.dart';

class AppPages {
  static const initial = Routes.home;

  static final routes = [
    GetPage(
      name: Routes.home,
      page: () => const Home(),
    ),
  ];
}
