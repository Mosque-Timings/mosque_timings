import 'package:flutter/material.dart';
import 'package:mosque_timings/src/widgets/language_selection.dart';
import 'package:mosque_timings/src/widgets/mosque_clock.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.language),
            onPressed: () {
              Get.dialog(const LanguageSelectionDialog());
            },
          ),
        ),
        body: MosqueClock());
  }
}
