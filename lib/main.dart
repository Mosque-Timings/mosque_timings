import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mosque_timings/src/config/routes/app_pages.dart';
import 'package:mosque_timings/src/config/routes/routes.dart';
import 'package:mosque_timings/src/services/firebase/firebase_notifiy_config.dart';
import 'package:flutter/foundation.dart';
import 'package:mosque_timings/src/services/localization/localization.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  if (!GetPlatform.isWeb) {
    FirebaseNotifyConfig().initialize();
  }
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      locale: LocalizationService.locale,
      fallbackLocale: LocalizationService.fallbackLocale,
      translations: LocalizationService(),
      debugShowCheckedModeBanner: false,
      getPages: AppPages.routes,
      initialRoute: Routes.home,
      title: 'Mosque Timings',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
