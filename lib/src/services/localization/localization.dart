import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mosque_timings/src/services/lang/en_us.dart';
import 'package:mosque_timings/src/services/lang/ur_pk.dart';

class LocalizationService extends Translations {
  // Default locale
  static final locale = Locale('ur', 'PK');

  // fallbackLocale saves the day when the locale gets in trouble
  static final fallbackLocale = Locale('en', 'US');

  // Supported languages
  // Needs to be same order with locales
  static final langs = [
    'Urdu',
    'English',
  ];

  // Supported locales
  // Needs to be same order with langs
  static final locales = [
    Locale('ur', 'PK'),
    Locale('en', 'US'),
  ];

  // Keys and their translations
  // Translations are separated maps in `lang` file
  @override
  Map<String, Map<String, String>> get keys => {
        'ur_PK': urPK,
        'en_US': enUS,
      };

  // Gets locale from language, and updates the locale
  void changeLocale(String lang) {
    final locale = _getLocaleFromLanguage(lang);
    Get.updateLocale(locale);
  }

  // Finds language in `langs` list and returns it as Locale
  Locale _getLocaleFromLanguage(String lang) {
    for (int i = 0; i < langs.length; i++) {
      if (lang == langs[i]) return locales[i];
    }

    return Get.locale!;
  }
}
