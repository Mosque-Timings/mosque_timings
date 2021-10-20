import 'package:flutter/material.dart';
import 'package:mosque_timings/src/widgets/custom_search_bar.dart';
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
        body: Get.size.width < 650
            ? Column(
              children: [
                CustomSearchBar(),
                Expanded(child: MosqueClock()),
              ],
            )
            : Get.size.width < 960
                ? Column(
                    children: [
                      CustomSearchBar(),
                      Expanded(
                        child: Row(
                          children: [
                            Expanded(child: MosqueClock()),
                            const Expanded(flex: 1, child: SizedBox())
                          ],
                        ),
                      ),
                    ],
                  )
                : Column(
                    children: [
                      CustomSearchBar(),
                      Expanded(
                        child: Row(
                          children: [
                            Expanded(child: MosqueClock()),
                            const Expanded(flex: 2, child: SizedBox())
                          ],
                        ),
                      ),
                    ],
                  ));
  }
}
